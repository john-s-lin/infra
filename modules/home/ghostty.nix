{
  programs = {
    ghostty = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      settings = {
        theme = "tokyo-passion.ghostty";
        auto-update = "off";
        cursor-style = "block";
        shell-integration-features = "no-cursor,ssh-terminfo,ssh-env";
        background-opacity = 1.0;
        font-family = "JetBrainsMono Nerd Font";
        font-size = 12;
        font-thicken = false;
        window-padding-x = 5;
        window-padding-y = 5;
        quit-after-last-window-closed = true;
        confirm-close-surface = false;
        clipboard-read = "allow";
        clipboard-write = "allow";
      };
    };
  };
}
