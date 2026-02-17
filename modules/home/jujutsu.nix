{ config, ... }:
{
  programs.jujutsu = {
    enable = true;

    settings = {
      # Import local identity file (not tracked in repo)
      import = [ "~/.config/jj/identity.toml" ];

      # Use Helix as the default editor
      ui.editor = "hx";

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
