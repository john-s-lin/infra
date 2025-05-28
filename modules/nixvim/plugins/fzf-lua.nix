{
  programs.nixvim.plugins.fzf-lua = {
    enable = true;
    profile = "fzf-native";

    keymaps = {
      "<leader> " = {
        action = "files";
        options = {
          silent = true;
          desc = "Find Files";
        };
      };
      "<leader>/" = {
        action = "live_grep";
        options = {
          silent = true;
          desc = "Grep (Root Dir)";
        };
      };
      "<leader>," = {
        action = "buffers";
        options = {
          silent = true;
          desc = "Buffers";
        };
      };
    };
  };
}
