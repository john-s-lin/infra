{ ... }:
{
  imports = [
    ../../../modules/home/server.nix
  ];

  home.username = "dietpi";
  home.homeDirectory = "/home/dietpi";
  home.stateVersion = "25.05";
}
