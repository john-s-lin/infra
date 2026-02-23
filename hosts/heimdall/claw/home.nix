{ ... }:
{
  imports = [
    ../../../modules/packages/agent.nix
    ../../../modules/home/git.nix
    ../../../modules/home/jujutsu.nix
    ../../../modules/home/direnv.nix
  ];

  home.username = "claw";
  home.homeDirectory = "/home/claw";
  home.stateVersion = "25.05";

  xdg.enable = true;
  programs.home-manager.enable = true;
}
