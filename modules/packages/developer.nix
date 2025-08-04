{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Terminal and CLIs
    alacritty
    bat
    bottom
    bun
    direnv
    fd
    fnm
    fzf
    ghostty
    gnumake
    helix
    hyperfine
    lazygit
    nvtopPackages.intel
    parallel
    rename
    ripgrep
    starship
    tree
    zellij
    zoxide

    # Editors
    vscode
    zed-editor
  ];
}
