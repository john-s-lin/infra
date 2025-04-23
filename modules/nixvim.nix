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

    keymaps = [
      {
        mode = "i";
        key = "jj";
        action = "<ESC>";
        options = {
          silent = true;
        };
        # Optional: add a description
        # description = "Exit Insert mode with jj";
      }
      {
        mode = "i"; # Insert mode
        key = "kk";
        action = "<ESC>";
        options = {
          silent = true;
        };
        # Optional: add a description
        # description = "Exit Insert mode with kk";
      }
      # Add other keymap definitions here...
    ];

    # Colorschemes
    colorschemes.tokyonight.enable = true;
  };
}
