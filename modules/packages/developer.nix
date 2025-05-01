{ pkgs, username, ... }:
{
  users.users.john.packages = with pkgs; [
    alacritty
    hyperfine
    tmux
    vscode
    zed-editor
  ];
}
