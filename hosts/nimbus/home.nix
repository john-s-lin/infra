{ username, ... }:
{
  imports = [
    ../../modules/home/bat.nix
    ../../modules/home/bottom.nix
    ../../modules/home/direnv.nix
    ../../modules/home/git.nix
    ../../modules/home/helix.nix
    ../../modules/home/jujutsu.nix
    ../../modules/home/zsh.nix

    # Terminal packages
    ../../modules/packages/terminal.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateversion = "25.05";
}
