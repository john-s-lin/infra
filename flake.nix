# flake.nix
{
  description = "A very basic flake";

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
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      zen-browser,
      dotfiles,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
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
    };
}
