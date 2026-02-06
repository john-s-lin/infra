{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Terminal emulators and editors
    alacritty
    bun
    fnm
    ghostty
    gnumake
    helix
    parallel
    vscode
    zed-editor
  ];
}
