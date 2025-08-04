{
  programs = {
    ghostty = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      themes = {
        tokyo-passion = {
          background = "#1a1b26";
          foreground = "#c0caf5";
          cursor-color = "#c0caf5";
          cursor-text = "#15161e";
          selection-foreground = "#c0caf5";
          selection-background = "#33467c";
          palette = [
            "0=#15161e"
            "1=#f7768e"
            "2=#1dba9a"
            "3=#e0af68"
            "4=#7aa2f7"
            "5=#bb9af7"
            "6=#32ade6"
            "7=#a9b1d6"
            "8=#414868"
            "9=#f7768e"
            "10=#3cc4a9"
            "11=#e0af68"
            "12=#7aa2f7"
            "13=#bb9af7"
            "14=#478cc7"
            "15=#c0caf5"
          ];
        };
      };
      settings = {
        theme = "tokyo-passion";
        auto-update = "off";
        cursor-style = "block";
        shell-integration-features = "no-cursor";
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
