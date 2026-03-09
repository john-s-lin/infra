{ pkgs, ... }:
{
  imports = [
    ../../../modules/home/common.nix
    ../../../modules/home/helix.nix
    ../../../modules/home/zsh.nix
  ];

  custom.zellij.enableAutoStart = false;

  home.file.".terminfo" = {
    source = "${pkgs.ghostty.terminfo}/share/terminfo";
    recursive = true;
  };

  home.username = "dietpi";
  home.homeDirectory = "/home/dietpi";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    gh
  ];

  home.shellAliases = {
    lg = "lazygit";
    cat = "bat";
  };

  xdg.enable = true;
  programs.home-manager.enable = true;
}
