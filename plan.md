Here's an example of how to modify your `flake.nix` to incorporate Hyprland with Cachix and Home Manager, while leaving the config to your dotfiles:

```nix
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
    dotfiles = {
      url = "github:john-s-lin/dotfiles";
      flake = false;
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      zen-browser,
      dotfiles,
      nix-darwin,
      hyprland,
      ...
    }@inputs:
    let
      mkUserConfig =
        {
          username,
          hostname,
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
              ./hosts/${hostname}/home.nix
            ];
          };
        };

      mkDarwinSystem =
        {
          hostname,
          system,
          username,
        }:
        nix-darwin.lib.darwinSystem {
          inherit system;
          specialArgs = {
            inherit inputs system;
          };
          modules = [
            ./hosts/${hostname}/configuration.nix
            home-manager.darwinModules.home-manager
            (mkUserConfig { inherit hostname system username; })
          ];
        };
    in
    {
      nixosConfigurations.john-nix-05 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          system = "x86_64-linux";
        };
        modules = [
          ./hosts/john-nix-05/configuration.nix
          home-manager.nixosModules.home-manager
          (mkUserConfig {
            hostname = "john-nix-05";
            username = "john";
            system = "x86_64-linux";
          })
          {
            nix.settings = {
              substituters = ["https://hyprland.cachix.org"];
              trusted-public-keys = ["hyprland.cachix.org-1:P3px9f17+F1jxFQVrloN7hfGnyqkUivepjG3X6LIkRY="];
            };
          }
        ];
      };

      darwinConfigurations = {
        "john-air-03" = mkDarwinSystem {
          hostname = "john-air-03";
          system = "aarch64-darwin";
          username = "john.lin";
        };

        "john-axl-06" = mkDarwinSystem {
          hostname = "john-axl-06";
          system = "aarch64-darwin";
          username = "john";
        };
      };
    };
}
```

In `hosts/john-nix-05/home.nix`, add `programs.hyprland.enable = true;` to enable Hyprland via Home Manager without managing the config file. Your dotfiles will handle `~/.config/hypr/hyprland.conf`.