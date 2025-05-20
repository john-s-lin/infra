{ config, lib, ... }:
{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps =
      let
        normal =
          lib.mapAttrsToList
            (key: action: {
              mode = "n";
              inherit action key;
            })
            {
              # Save
              "<leader>w" = ":w<CR>";
              # Quit
              "<leader>q" = ":q<CR>";
              # Force quit
              "<leader>Q" = ":q!<CR>";

              # TODO
            };
        insert =
          lib.mapAttrsToList
            (key: action: {
              mode = "i";
              inherit action key;
            })
            {
              # Escape "jj" "kk" or "jk"
              "jj" = "<ESC>";
              "kk" = "<ESC>";
              "jk" = "<ESC>";
            };
        visual =
          lib.mapAttrsToList
            (key: action: {
              mode = "v";
              inherit action key;
            })
            {
              # Move selected lines up/down
              "<A-j>" = ":m '>+1<CR>gv=gv";
              "<A-k>" = ":m '<-2<CR>gv=gv";

              # Indent while in visual mode
              ">" = ">gv";
              "<" = "<gv";
            };
      in
      config.lib.nixvim.keymaps.mkKeymaps { options.silent = true; } (normal ++ insert ++ visual);
  };
}
