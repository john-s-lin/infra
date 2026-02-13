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

  home.username = "john";
  home.homeDirectory = "/home/john";

  home.stateVersion = "25.05";

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
