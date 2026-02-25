{
  programs = {
    alacritty = {
      enable = true;

      settings = {
        general = {
          live_config_reload = true;
        };

        window = {
          decorations = "None";
          opacity = 1.0;
          blur = false;
          dynamic_padding = true;
          padding = {
            x = 5;
            y = 5;
          };
        };

        font = {
          normal = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Regular";
          };
          bold = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Bold";
          };
          italic = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Italic";
          };
          bold_italic = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Bold Italic";
          };
          size = 12;
        };

        # Tokyo Night theme
        colors = {
          primary = {
            background = "#1a1b26";
            foreground = "#a9b1d6";
          };

          normal = {
            black = "#32344a";
            red = "#f7768e";
            green = "#9ece6a";
            yellow = "#e0af68";
            blue = "#7aa2f7";
            magenta = "#ad8ee6";
            cyan = "#449dab";
            white = "#787c99";
          };

          bright = {
            black = "#444b6a";
            red = "#ff7a93";
            green = "#b9f27c";
            yellow = "#ff9e64";
            blue = "#7da6ff";
            magenta = "#bb9af7";
            cyan = "#0db9d7";
            white = "#acb0d0";
          };
        };
      };
    };
  };
}
