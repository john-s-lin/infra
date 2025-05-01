{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alacritty
    hyperfine
    tmux
    vscode
    zed-editor
  ];
}
