{ pkgs, ... }:
{
  programs.zsh.promptInit = ''
    autoload -U colors && colors
    PROMPT="%{$fg_bold[yellow]%}%n@%m%{$reset_color%} $PROMPT"
  '';

  home.file.".terminfo" = {
    source = "${pkgs.ghostty.terminfo}/share/terminfo";
    recursive = true;
  };

  home.shellAliases = {
    lg = "lazygit";
    cat = "bat";
  };

  xdg.enable = true;
  programs.home-manager.enable = true;
}
