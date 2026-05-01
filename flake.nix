# flake.nix
{
  description = "Infra for NixOS and nix-darwin on MacOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      zen-browser,
      nix-darwin,
      ...
    }@inputs:
    let
      mkUserConfig =
        {
          username,
          hostKey,
          system,
        }:
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.extraSpecialArgs = {
            inherit
              inputs
              system
              username
              hostKey
              ;
          };
          home-manager.users.${username} = {
            imports = [
              ./hosts/${hostKey}/home.nix
            ];
          };
        };

      mkNixosSystem =
        {
          hostKey,
          hostname,
          system,
          username,
        }:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              system
              username
              hostname
              ;
          };
          modules = [
            ./hosts/${hostKey}/configuration.nix
            home-manager.nixosModules.home-manager
            (mkUserConfig { inherit hostKey system username; })
          ];
        };

      mkDarwinSystem =
        {
          hostKey,
          hostname ? null,
          system,
          username,
        }:
        nix-darwin.lib.darwinSystem {
          inherit system;
          specialArgs = {
            inherit inputs system username;
          };
          modules = [
            ./hosts/${hostKey}/configuration.nix
            home-manager.darwinModules.home-manager
            (mkUserConfig { inherit hostKey system username; })
          ]
          ++ nixpkgs.lib.optional (hostname != null) {
            networking.hostName = hostname;
          }
          # TEMPORARY: direnv 2.37.1 checkPhase hangs on aarch64-darwin due to test suite
          # creating directories with literal backspace/carriage return characters that
          # trip up macOS APFS. Remove once upstream fixes this.
          # Ref: https://github.com/NixOS/nixpkgs/issues/507531
          ++ nixpkgs.lib.optional (system == "aarch64-darwin") {
            nixpkgs.overlays = [
              (final: prev: {
                direnv = prev.direnv.overrideAttrs (old: final.lib.optionalAttrs final.stdenv.isDarwin {
                  doCheck = false;
                });
              })
            ];
          };
        };

      mkStandaloneHome =
        {
          hostKey,
          hostname ? null,
          system,
          username,
          home ? "/home/${username}",
        }:
        let
          multiUserPath = ./hosts/${hostKey}/${username}/home.nix;
          singleUserPath = ./hosts/${hostKey}/home.nix;
          modulePath = if builtins.pathExists multiUserPath then multiUserPath else singleUserPath;
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ modulePath ];
          extraSpecialArgs = {
            inherit
              inputs
              username
              system
              hostname
              hostKey
              home
              ;
          };
        };
    in
    {
      nixosConfigurations = {
        "john-tpd-05" = mkNixosSystem {
          hostKey = "john-tpd-05";
          hostname = "john-tpd-05";
          username = "john";
          system = "x86_64-linux";
        };
      };

      darwinConfigurations = {
        "john-mba-03" = mkDarwinSystem {
          hostKey = "john-mba-03";
          hostname = "john-mba-03";
          system = "aarch64-darwin";
          username = "john";
        };

        "john-mbp-04" = mkDarwinSystem {
          hostKey = "john-mbp-04";
          hostname = "john-mbp-04";
          system = "x86_64-darwin";
          username = "john";
        };

        "work-mbp-01" = mkDarwinSystem {
          hostKey = "work-mbp-01";
          system = "aarch64-darwin";
          username = "johnslin";
        };
      };

      # VPS Home-Manager only
      homeConfigurations = {
        "john@ajax" = mkStandaloneHome {
          hostKey = "ajax";
          hostname = "ajax";
          username = "john";
          system = "aarch64-linux";
        };
        "claw@ajax" = mkStandaloneHome {
          hostKey = "ajax";
          hostname = "ajax";
          username = "claw";
          system = "aarch64-linux";
        };

        # Raspberry Pi - DietPi Home-Manager only
        "dietpi@apollo" = mkStandaloneHome {
          hostKey = "apollo";
          hostname = "apollo";
          username = "dietpi";
          system = "aarch64-linux";
        };
        "dietpi@atlas" = mkStandaloneHome {
          hostKey = "atlas";
          hostname = "atlas";
          username = "dietpi";
          system = "aarch64-linux";
        };

        "johnslin@nimbus" = mkStandaloneHome {
          hostKey = "nimbus";
          username = "johnslin";
          system = "x86_64-linux";
          home =
            let
              h = builtins.getEnv "HOME";
            in
            if h != "" then h else "/home/johnslin";
        };
      };
    };
}
