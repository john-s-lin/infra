{
  description = "Entrypoint Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles = {
      url = "github:john-s-lin/dotfiles";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixos-cosmic, nixvim, home-manager, dotfiles, ... }@inputs: 
    let 
      system = "x86_64-linux";
      specialArgs = { inherit inputs dotfiles nixvim system; };
    in
    {
    nixosConfigurations.john-nix-05 = nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = [
        ./hosts/john-nix-05/configuration.nix
	home-manager.nixosModules.home-manager
      ];
    };
  };
}
