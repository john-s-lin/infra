{ config, ... }:
{
  programs.jujutsu = {
    enable = true;

    settings = {
      # Git interoperability settings
      git = {
        # Automatically create local bookmarks for Git branches
        auto-local-bookmark = true;
      };

      # Enable color output
      ui.color = "auto";
    };
  };
}
