{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.sessionVariables = lib.mkIf pkgs.stdenv.isDarwin {
    _ZO_DATA_DIR = "${config.users.users.username.home}/.local/share/zoxide";
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}
