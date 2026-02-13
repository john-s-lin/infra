{ pkgs, lib, config, ... }:
{
  options.custom.zellij = {
    enableAutoStart = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable zellij auto-start in zsh (disable for SSH servers)";
    };
  };

  config = {
    programs.zellij = {
      enable = true;
      enableZshIntegration = config.custom.zellij.enableAutoStart;

      settings = {
        theme = "tokyo-night-dark";
        pane_frames = true;
        copy_command = if pkgs.stdenv.isLinux then "wl-copy" else "pbcopy";
        show_startup_tips = false;
        scroll_buffer_size = 100000;
      };
    };
  };
}
