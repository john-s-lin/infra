{ pkgs, ... }:
let
  terminal = "ghostty";
  fileManager = "nautilus";
  menu = "rofi -show drun";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";
      "$shiftMod" = "$mainMod + SHIFT";
      "$terminal" = terminal;
      "$fileManager" = fileManager;
      "$menu" = menu;

      monitor = [
        "eDP-1, 1920x1080@60.05, 0x0, 1"
        "DP-2, 1920x1080@75, 0x-1080, 1"
      ];

      exec-once = [
        terminal
        "waybar"
        "hyprpaper"
        "hypridle"
      ];

      env = [
        "XCURSOR_SIZE,28"
        "HYPRCURSOR_SIZE,28"
        "XCURSOR_THEME,macOS-White"
        "HYPRCURSOR_THEME,macOS-White"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = "yes, please :)";
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        natural_scroll = true;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      gesture = "3, horizontal, workspace";

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      bind = [
        "$mainMod, Q, killactive,"
        "$mainMod CTRL, Q, exec, loginctl lock-session"
        "$mainMod SHIFT, Q, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, SPACE, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod, PRINT, exec, hyprshot -m window"
        ", PRINT, exec, hyprshot -m output"
        "$shiftMod, PRINT, exec, hyprshot -m region"
        "$mainMod, Tab, cyclenext"
        "$mainMod SHIFT, Tab, cyclenext, prev"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = false;
        disable_loading_bar = true;
      };

      background = {
        monitor = "";
        path = "~/Pictures/Wallpapers/arch-02-tokyo.jpg";
        blur_passes = 2;
        blur_size = 5;
      };

      input-field = {
        monitor = "";
        size = "300, 60";
        outline_thickness = 0;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = false;
        dots_rounding = -1;
        dots_fade_time = 10;
        outer_color = "rgba(17, 17, 17, 1)";
        inner_color = "rgba(200, 200, 200, 1)";
        font_color = "rgba(100, 100, 100, 1)";
        font_family = "JetBrains Mono Nerd Font Medium Italic";
        fade_on_empty = false;
        rounding = 20;
        check_color = "rgba(204, 136, 34, 1.0)";
        fail_color = "rgba(204, 34, 34, 1.0)";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        fail_timeout = 2000;
        fail_transition = 300;
        hide_input = false;
        placeholder_text = "Input password...";
        position = "0, -350";
        halign = "center";
        valign = "center";
      };

      label = {
        monitor = "";
        text = "cmd[update:1000] echo \"<span>$(date +'%Y-%m-%d // %H:%M:%S')</span>\"";
        color = "rgba(200, 200, 200, 1.0)";
        font_size = 50;
        font_family = "JetBrains Mono Nerd Font Bold";
        position = "0, -150";
        halign = "center";
        valign = "center";
      };
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Pictures/Wallpapers/arch-02-tokyo.jpg"
        "~/Pictures/Wallpapers/arch-01-nz.jpg"
      ];
      wallpaper = [
        "eDP-1, ~/Pictures/Wallpapers/arch-02-tokyo.jpg"
        "DP-1, ~/Pictures/Wallpapers/arch-01-nz.jpg"
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 120;
          on-timeout = "brightnessctl -s set 5%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 330;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  programs.waybar = {
    enable = true;
    settings = [
      {
        reload_style_on_change = true;
        layer = "top";
        position = "top";
        spacing = 0;
        height = 26;
        "modules-left" = [
          "custom/omarchy"
          "hyprland/workspaces"
        ];
        "modules-center" = [
          "clock"
          "custom/update"
          "custom/screenrecording-indicator"
        ];
        "modules-right" = [
          "group/tray-expander"
          "bluetooth"
          "network"
          "pulseaudio"
          "cpu"
          "battery"
        ];
        "hyprland/workspaces" = {
          "on-click" = "activate";
          format = "{icon}";
          "format-icons" = {
            default = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            active = "󱓻";
          };
          "persistent-workspaces" = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
        };
        "custom/omarchy" = {
          format = "<span font='omarchy'>\ue900</span>";
          "on-click" = "omarchy-menu";
          "tooltip-format" = "Omarchy Menu\n\nSuper + Alt + Space";
        };
        "custom/update" = {
          format = "";
          exec = "omarchy-update-available";
          "on-click" = "omarchy-launch-floating-terminal-with-presentation omarchy-update";
          "tooltip-format" = "Omarchy update available";
          signal = 7;
          interval = 3600;
        };
        cpu = {
          interval = 5;
          format = "󰍛";
          "on-click" = "${terminal} -e btm";
        };
        clock = {
          format = "{:L%A %H:%M}";
          "format-alt" = "{:L%d %B W%V %Y}";
          tooltip = false;
          "on-click-right" = "omarchy-cmd-tzupdate";
        };
        network = {
          "format-icons" = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format = "{icon}";
          "format-wifi" = "{icon}";
          "format-ethernet" = "󰀂";
          "format-disconnected" = "󰤮";
          "tooltip-format-wifi" = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          "tooltip-format-ethernet" = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          "tooltip-format-disconnected" = "Disconnected";
          interval = 3;
          spacing = 1;
          "on-click" = "omarchy-launch-wifi";
        };
        battery = {
          format = "{capacity}% {icon}";
          "format-discharging" = "{icon}";
          "format-charging" = "{icon}";
          "format-plugged" = "";
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
          "format-full" = "󰂅";
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
          format = "";
          "format-disabled" = "󰂲";
          "format-connected" = "";
          "tooltip-format" = "Devices connected: {num_connections}";
          "on-click" = "blueberry";
        };
        pulseaudio = {
          format = "{icon}";
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
        "group/tray-expander" = {
          orientation = "inherit";
          drawer = {
            "transition-duration" = 600;
            "children-class" = "tray-group-item";
          };
          modules = [
            "custom/expand-icon"
            "tray"
          ];
        };
        "custom/expand-icon" = {
          format = " ";
          tooltip = false;
        };
        "custom/screenrecording-indicator" = {
          "on-click" = "omarchy-cmd-screenrecord";
          exec = "$OMARCHY_PATH/default/waybar/indicators/screen-recording.sh";
          signal = 8;
          "return-type" = "json";
        };
        tray = {
          "icon-size" = 12;
          spacing = 12;
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
        font-family: CaskaydiaMono Nerd Font;
        font-size: 12px;
      }

      .modules-left {
        margin-left: 8px;
      }

      .modules-right {
        margin-right: 8px;
      }

      #workspaces button {
        all: initial;
        padding: 0 6px;
        margin: 0 1.5px;
        min-width: 9px;
      }

      #workspaces button.empty {
        opacity: 0.5;
      }

      #tray,
      #cpu,
      #battery,
      #network,
      #bluetooth,
      #pulseaudio,
      #custom-omarchy,
      #custom-screenrecording-indicator,
      #custom-update {
        min-width: 12px;
        margin: 0 7.5px;
      }

      #custom-expand-icon {
        margin-right: 7px;
      }

      tooltip {
        padding: 2px;
      }

      #custom-update {
        font-size: 10px;
      }

      #clock {
        margin-left: 8.75px;
      }

      .hidden {
        opacity: 0;
      }

      #custom-screenrecording-indicator {
        min-width: 12px;
        margin-left: 8.75px;
        font-size: 10px;
      }

      #custom-screenrecording-indicator.active {
        color: #a55555;
      }
    '';
  };

  home.packages = with pkgs; [
    rofi
    waybar
    hyprshot
    brightnessctl
    playerctl
    blueberry
    pavucontrol
    apple-cursor
  ];
}
