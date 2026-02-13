{ pkgs, ... }:
{
  imports = [
    ./bat.nix
    ./bottom.nix
    ./direnv.nix
    ./git.nix
    ./starship.nix
    ./zellij.nix
    ./zoxide.nix
  ];

  # Terminal tools managed by nixpkgs (previously in Homebrew brews)
  home.packages = with pkgs; [
    fd
    fzf
    hyperfine
    lazygit
    ripgrep
    tree
    rename
  ];
}
