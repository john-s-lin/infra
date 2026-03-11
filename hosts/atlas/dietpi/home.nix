{ ... }:
{
  imports = [
    # Server tools (previously in server.nix)
    ../../modules/home/bat.nix
    ../../modules/home/bottom.nix
    ../../modules/home/direnv.nix
    ../../modules/home/git.nix
    ../../modules/home/jujutsu.nix
    ../../modules/home/helix.nix
    ../../modules/home/zsh.nix
  ];

  home.username = "dietpi";
  home.homeDirectory = "/home/dietpi";
  home.stateVersion = "25.05";
}
