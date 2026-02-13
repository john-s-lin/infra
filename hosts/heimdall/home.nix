{
  imports = [
    # Dotfiles configuration
    ../../modules/home/dotfiles.nix

    # Common terminal tools (shared across all hosts)
    # Includes: bottom, starship, direnv, bat, git, zoxide, zellij
    # Packages: fd, fzf, hyperfine, lazygit, ripgrep, tree
    ../../modules/home/common.nix

    # Host-specific config
    ../../modules/home/helix.nix
    ../../modules/home/opencode.nix
    ../../modules/home/zsh.nix
  ];

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
