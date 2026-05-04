{ pkgs, ... }:
{
  imports = [
    ./starship-server.nix
  ];

  programs.zsh.initContent = ''
    if [ -f ~/.bash_aliases ]; then
      . ~/.bash_aliases
    fi
  '';

  programs.bash = {
    enable = true;
    initExtra = ''
      if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
      fi
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
