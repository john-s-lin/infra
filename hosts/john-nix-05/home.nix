{
  pkgs,
  config,
  lib,
  dotfiles,
  inputs,
  nixvim,
  ...
}@args:
{
  imports = [
    ../../modules/nixvim.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.username = "john";
  home.homeDirectory = "/home/john";

  home.stateVersion = "24.11";

  home.file = {
    ".bash_aliases".source = "${dotfiles}/.bash_aliases";
    ".bashrc".source = "${dotfiles}/.bashrc";
    ".gitconfig".source = "${dotfiles}/.gitconfig";
    ".zshrc".source = "${dotfiles}/.zshrc";

    # Config
    ".config/alacritty" = {
      source = "${dotfiles}/config/alacritty";
      recursive = true;
    };
    ".config/bat" = {
      source = "${dotfiles}/config/bat";
      recursive = true;
    };
    ".config/bottom" = {
      source = "${dotfiles}/config/bottom";
      recursive = true;
    };
    ".config/evremap" = {
      source = "${dotfiles}/config/evremap";
      recursive = true;
    };
    ".config/ghostty" = {
      source = "${dotfiles}/config/ghostty";
      recursive = true;
    };
    ".config/hypr" = {
      source = "${dotfiles}/config/hypr";
      recursive = true;
    };
    ".config/starship" = {
      source = "${dotfiles}/config/starship";
      recursive = true;
    };
    ".config/tmux" = {
      source = "${dotfiles}/config/tmux";
      recursive = true;
    };
    ".config/zed" = {
      source = "${dotfiles}/config/zed";
      recursive = true;
    };
    ".config/zellij" = {
      source = "${dotfiles}/config/zellij";
      recursive = true;
    };
    ".config/zsh" = {
      source = "${dotfiles}/config/zsh";
      recursive = true;
    };
  };
}
