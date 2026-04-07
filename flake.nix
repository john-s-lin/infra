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
            inherit inputs system;
          };
          home-manager.users.john = {
            imports = [
              ./hosts/${hostKey}/home.nix
            ];
          };
        };

      mkDarwinSystem =
        {
          hostKey,
          system,
          username,
        }:
        nix-darwin.lib.darwinSystem {
          inherit system;
          specialArgs = {
            inherit inputs system;
          };
          modules = [
            ./hosts/${hostKey}/configuration.nix
            home-manager.darwinModules.home-manager
            (mkUserConfig { inherit hostKey system username; })
          ];
        };

      mkStandaloneHome =
        {
          hostname,
          system,
          username,
        }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./hosts/${hostname}/${username}/home.nix ];
          extraSpecialArgs = { inherit inputs; };
        };
    in
    {
      nixosConfigurations.john-tpd-05 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          system = "x86_64-linux";
        };
        modules = [
          ./hosts/john-tpd-05/configuration.nix
          home-manager.nixosModules.home-manager
          (mkUserConfig {
            hostKey = "john-tpd-05";
            username = "john";
            system = "x86_64-linux";
          })
        ];
      };

      darwinConfigurations = {
        "john-mba-03" = mkDarwinSystem {
          hostKey = "john-mba-03";
          system = "aarch64-darwin";
          username = "john";
        };

        "john-mbp-04" = mkDarwinSystem {
          hostKey = "john-mbp-04";
          system = "x86_64-darwin";
          username = "john";
        };

        "work-mbp-01" = mkDarwinSystem {
          hostKey = "work-mbp-01";
          system = "aarch64-darwin";
          username = "john";
        };
      };

      # VPS Home-Manager only
      homeConfigurations = {
        "john@ajax" = mkStandaloneHome {
          hostname = "ajax";
          username = "john";
          system = "aarch64-linux";
        };
        "claw@ajax" = mkStandaloneHome {
          hostname = "ajax";
          username = "claw";
          system = "aarch64-linux";
        };

        # Raspberry Pi - DietPi Home-Manager only
        "dietpi@apollo" = mkStandaloneHome {
          hostname = "apollo";
          username = "dietpi";
          system = "aarch64-linux";
        };
        "dietpi@atlas" = mkStandaloneHome {
          hostname = "atlas";
          username = "dietpi";
          system = "aarch64-linux";
        };
      };
    };
}
