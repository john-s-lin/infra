{ pkgs, lib, ... }:
{
  home.sessionVariables = lib.mkIf pkgs.stdenv.isDarwin {
    _ZO_DATA_DIR = "/Users/john.lin/.local/share/zoxide";
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
