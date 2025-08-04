{ ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
    ];

    userSettings = {
      agent = {
        enabled = false;
      };
      features = {
        edit_prediction_provider = "none";
      };
      auto_install_extensions = {
        html = false;
      };
      auto_update = false;
      base_keymap = "VSCode";
      buffer_font_family = "JetBrainsMono Nerd Font Mono";
      buffer_font_fallbacks = [ "Zed Plex Mono" ];
      buffer_font_size = 13;
      disable_ai = true;
      enable_language_server = true;
      format_on_save = "on";
      git_panel = {
        dock = "right";
      };
      minimap = {
        show = "always";
        thumb = "always";
        thumb_border = "left_open";
        current_line_highlight = "line";
      };
      preferred_line_length = 120;
      project_panel = {
        dock = "left";
      };
      relative_line_numbers = true;
      remove_trailing_whitespace_on_save = true;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      terminal = {
        line_height = "standard";
      };
      theme = "One Dark Pro";
      ui_font_family = "Geist";
      ui_font_fallbacks = [ "Zed Plex Sans" ];
      ui_font_size = 16;
      vim_mode = true;
      wrap_guides = [ 120 ];

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
      };

      # Custom configuration options for language servers
      # ref: https://zed.dev/docs/configuring-languages#configuring-language-servers
      lsp = {
        # ref: https://github.com/oxalica/nil/blob/577d160da311cc7f5042038456a0713e9863d09e/docs/configuration.md
        nil.nix.flake.autoArchive = true;
      };
    };
  };
}
