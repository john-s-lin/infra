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
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      zen-browser,
      dotfiles,
      nix-darwin,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      mkDarwinSystem =
        { hostname, system }:
        nix-darwin.lib.darwinSystem {
          inherit system;
          specialArgs = {
            inherit inputs system;
          };
          modules = [
            ./hosts/${hostname}/configuration.nix

            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs system;
              };
              home-manager.users.john = {
                imports = [
                  ./hosts/${hostname}/home.nix
                ];
              };
            }
          ];
        };
    in
    {
      nixosConfigurations.john-nix-05 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [
          ./hosts/john-nix-05/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs system; };
            home-manager.users.john = {
              imports = [
                ./hosts/john-nix-05/home.nix
              ];
            };
          }
        ];
      };

      darwinConfigurations = {
        "john-air-03" = mkDarwinSystem {
          hostname = "john-air-03";
          system = "aarch64-darwin";
        };

        "john-axl-06" = mkDarwinSystem {
          hostname = "john-axl-06";
          system = "aarch64-darwin";
        };
      };
    };
}
