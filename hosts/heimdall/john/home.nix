{ pkgs, ... }:
{
  imports = [
    # Dotfiles configuration
    ../../modules/home/dotfiles.nix

    # Common terminal tools (shared across all hosts)
    # Includes: bottom, starship, direnv, bat, git, zoxide, zellij
    # Packages: fd, fzf, hyperfine, lazygit, ripgrep, tree
    ../../modules/home/common.nix

    # AI/development packages
    ../../modules/packages/ai.nix

    # Host-specific config
    ../../modules/home/helix.nix
    ../../modules/home/opencode.nix
    ../../modules/home/zsh.nix
  ];

  # Server-specific: disable zellij auto-start to prevent nested sessions when SSH'd from workstation
  custom.zellij.enableAutoStart = false;

  # Ghostty terminfo: system ncurses 6.4 compiles a corrupted entry;
  # use the Nix-built terminfo (ncurses 6.6) to ensure correct terminal capabilities
  home.file.".terminfo" = {
    source = "${pkgs.ghostty.terminfo}/share/terminfo";
    recursive = true;
  };

  home.username = "john";
  home.homeDirectory = "/home/john";

  home.stateVersion = "25.05";

  # Server packages
  home.packages = with pkgs; [
    gh
  ];

  # Aliases
  home.shellAliases = {
    lg = "lazygit";
    cat = "bat";
  };

  # Enable XDG
  xdg.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
