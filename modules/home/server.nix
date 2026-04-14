{ pkgs, ... }:
{
  programs.zsh.initContent = ''
    if [ -f ~/.bash_aliases ]; then
      . ~/.bash_aliases
    fi
    PROMPT="%{$fg_bold[yellow]%}%n@%m%{$reset_color%} $PROMPT"
  '';

  programs.bash = {
    enable = true;
    initExtra = ''
      if [-f ~/.bash_aliases ]; then
        . ~/.bash_aliases
      fi
      PS1="\[\033[1;33m\]\u@\h\[\033[0m\] $PS1"
    '';
  };

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
