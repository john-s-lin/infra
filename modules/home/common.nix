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
    lazydocker
    lazygit
    ripgrep
    tree
    (if stdenv.isDarwin then nvtopPackages.apple else nvtopPackages.full)
    rename
  ];
}
