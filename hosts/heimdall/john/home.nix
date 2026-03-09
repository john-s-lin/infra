{ ... }:
{
  imports = [
    ../../../modules/home/server.nix

    # AI/development packages
    ../../../modules/packages/ai.nix
    ../../../modules/home/opencode.nix
  ];

  home.username = "john";
  home.homeDirectory = "/home/john";
  home.stateVersion = "25.05";
}
