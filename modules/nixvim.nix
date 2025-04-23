{
  pkgs,
  config,
  lib,
  dotfiles,
  inputs,
  ...
}:

{
  programs.nixvim = {
    enable = true;

    opts = {
      # Line numbers
      number = true;
      relativenumber = true;

      # Mouse
      mouse = "a";

      # Tabs
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
    };

    colorschemes.tokyonight.enable = true;
  };
}
