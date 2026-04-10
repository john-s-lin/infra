{ username, ... }:
{
  imports = [
    ../../../modules/packages/agent.nix
    ../../../modules/home/git.nix
    ../../../modules/home/jujutsu.nix
    ../../../modules/home/direnv.nix

    # Terminal packages
    ../../../modules/packages/terminal.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  xdg.enable = true;
  programs.home-manager.enable = true;
}
