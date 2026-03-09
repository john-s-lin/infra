{ pkgs, ... }:
{
  imports = [
    ./common.nix
    ./helix.nix
    ./zsh.nix
  ];

  programs.zsh.initContent = ''
    PROMPT="%{$fg_bold[yellow]%}%n@%m%{$reset_color%} $PROMPT"
  '';

  # Ghostty terminfo: system ncurses 6.4 compiles a corrupted entry;
  # use the Nix-built terminfo (ncurses 6.6) to ensure correct terminal capabilities
  home.file.".terminfo" = {
    source = "${pkgs.ghostty.terminfo}/share/terminfo";
    recursive = true;
  };

  home.packages = with pkgs; [ gh ];

  home.shellAliases = {
    lg = "lazygit";
    cat = "bat";
  };

  xdg.enable = true;
  programs.home-manager.enable = true;
}
