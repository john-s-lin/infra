{ lib, pkgs, ... }:
let
  # Zed settings - platform-specific
  # On Linux: use programs.zed-editor with userSettings
  # On Darwin: use xdg.configFile since Zed is installed via Homebrew
  zedSettings = {
    features = {
      edit_prediction_provider = "none";
    };
    auto_install_extensions = {
      html = false;
    };
    auto_update = false;
    base_keymap = "VSCode";
    buffer_font_family = "JetBrainsMono Nerd Font Mono";
    buffer_font_size = 13;
    colorize_brackets = true;
    disable_ai = true;
    format_on_save = "on";
    git_panel = {
      dock = "right";
    };
    preferred_line_length = 120;
    project_panel = {
      dock = "left";
    };
    relative_line_numbers = "enabled";
    telemetry = {
      diagnostics = false;
      metrics = false;
    };
    terminal = {
      line_height = "standard";
    };
    theme = "One Dark Pro";
    ui_font_family = "Geist";
    ui_font_size = 16;
    vim_mode = true;
    languages = {
      Nix = {
        language_servers = [
          "nil"
          "!nixd"
        ];
        formatter = {
          external = {
            command = "nixfmt";
          };
        };
      };
      Python = {
        language_servers = [
          "!ty"
          "basedpyright"
          "ruff"
        ];
      };
    };
  };
in
{
  # Linux: use programs.zed-editor
  programs.zed-editor = lib.optionalAttrs pkgs.stdenv.isLinux {
    enable = true;
    userSettings = zedSettings;
  };

  # Darwin: use xdg.configFile since Zed is installed via Homebrew
  home.file = lib.optionalAttrs pkgs.stdenv.isDarwin {
    ".config/zed/settings.json" = {
      text = builtins.toJSON zedSettings;
    };
  };
}
