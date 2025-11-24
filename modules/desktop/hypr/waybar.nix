{
  programs.waybar = {
    enable = true;
    settings = [
      {
        reload_style_on_change = true;
        layer = "top";
        position = "top";
        spacing = 0;
        height = 30;
        "modules-left" = [
          "hyprland/workspaces"
        ];
        "modules-center" = [
          "clock"
        ];
        "modules-right" = [
          "bluetooth"
          "pulseaudio"
          "network"
          "temperature"
          "cpu"
          "memory"
          "battery"
          "custom/power"
        ];
        "hyprland/workspaces" = {
          "on-click" = "activate";
          format = "{name}";
          "persistent-workspaces" = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
          };
        };
        cpu = {
          interval = 1;
          format = "  {icon0}{icon1}{icon2}{icon3} {usage:>2}% ";
          "format-icons" = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
        };
        temperature = {
          format = "{temperatureC}°C ";
          "critical-threshold" = 80;
          interval = 5;
        };
        memory = {
          interval = 30;
          format = "  {used:0.1f}G/{total:0.1f}G  ";
        };
        clock = {
          format = "{:%Y-%m-%d %H:%M:%S}";
          "format-alt" = "{:%A, %b %d, %Y}";
          tooltip = false;
          interval = 1;
          "on-click-right" = "thunderbird";
        };
        network = {
          "format-wifi" = "󰤢  ";
          "format-ethernet" = "󰈀  ";
          "format-disconnected" = "󰤠  ";
          "tooltip-format-wifi" = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          "tooltip-format-ethernet" = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          "tooltip-format-disconnected" = "Disconnected";
          "on-click" = "networkmanager_dmenu";
          interval = 5;
        };
        battery = {
          format = "{capacity}% {icon}  ";
          "format-discharging" = "{capacity}% {icon}  ";
          "format-charging" = "{capacity}% {icon}  ";
          "format-plugged" = "  ";
          "format-icons" = {
            charging = [
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
            default = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
          "format-full" = "󰂅  ";
          "tooltip-format-discharging" = "{power:>1.0f}W↓ {capacity}%";
          "tooltip-format-charging" = "{power:>1.0f}W↑ {capacity}%";
          interval = 5;
          "on-click" = "omarchy-menu power";
          states = {
            warning = 20;
            critical = 10;
          };
        };
        bluetooth = {
          format = "  ";
          "format-disabled" = "";
          "format-connected" = "  ";
          "tooltip-format" = "Devices connected: {num_connections}";
          "on-click" = "blueberry";
        };
        pulseaudio = {
          format = "{icon}  ";
          "on-click" = "pavucontrol";
          "on-click-right" = "pamixer -t";
          "tooltip-format" = "Playing at {volume}%";
          "scroll-step" = 5;
          "format-muted" = "";
          "format-icons" = {
            default = [
              ""
              ""
              ""
            ];
          };
        };
        tray = {
          "icon-size" = 12;
          spacing = 12;
          "reverse-direction" = true;
        };
        "custom/power" = {
          format = "⏻ ";
          tooltip = "Power Menu";
          on-click = "wlogout";
        };
      }
    ];
    style = ''
      * {
        background-color: #000000;
        color: #ffffff;
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: "Geist Mono Nerd Font", "Font Awesome 7 Free", "Font Awesome 7 Brands";
        font-size: 16px;
      }

      .modules-left {
        margin-left: 8px;
      }

      .modules-right {
        margin-right: 8px;
      }

      #workspaces {
        color: transparent;
        margin-right: 1.5px;
        margin-left: 1.5px;
      }

      #workspaces button {
        padding: 0 6px;
        margin: 0 1.5px;
        min-width: 9px;
        color: #888888;
        transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
      }

      #workspaces button.empty {
        opacity: 0.5;
      }

      #workspaces button.active {
        color: #ffffff;
        border-bottom: 3px solid white;
      }

      #workspaces button.focused {
        color: #444444;
      }

      #workspaces button.urgent {
        background: rgba(255, 200, 0, 0.35);
        border-bottom: 3px dashed #ffaa00;
        color: #ffaa00;
      }

      tooltip {
        padding: 2px;
      }

      #clock {
        color: #fff;
        border-radius: 5px;
        margin-right: 1rem;
      }

      .hidden {
        opacity: 0;
      }
    '';
  };
}
