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
      darwinSystem = "aarch64-darwin";
    in
    {
      nixosConfigurations.john-nix-05 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [
          ./hosts/john-nix-05/configuration.nix

          # Enable Home Manager and define user 'john' here
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs system; };
            home-manager.users.john = {
              # This is the *only* place this block should be defined
              # Arguments (config, pkgs, inputs) are automatically passed by Home Manager
              imports = [
                ./hosts/john-nix-05/home.nix # Your main Home Manager config
              ];
            };
          }
        ];
      };
      darwinConfigurations."john-air-03" = nix-darwin.lib.darwinSystem {
        system = darwinSystem;
        specialArgs = {
          inherit inputs;
          system = darwinSystem;
        };
        modules = [
          ./hosts/john-air-03/configuration.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              system = darwinSystem;
            };
            home-manager.users.john = {
              imports = [
                # Point to the new home-manager config for this host
                ./hosts/john-air-03/home.nix
              ];
            };
          }
        ];
      };
    };
}
