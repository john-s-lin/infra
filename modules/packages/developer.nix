{ pkgs, ... }:
{
  users.users.john.packages = with pkgs; [
    # Terminal and CLIs
    alacritty
    bat
    bottom
    bun
    fd
    fnm
    fzf
    ghostty
    gnumake
    hyperfine
    lazygit
    nvtopPackages.intel
    parallel
    rename
    ripgrep
    starship
    tmux
    tree
    uv
    zoxide

    # Editors
    vscode
    zed-editor
  ];
}
