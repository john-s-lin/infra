{ mkDotfilesSymlink, ... }:
{
  imports = [
    # Dotfiles configuration
    ../../modules/home/dotfiles.nix

    # Config
    ../../modules/home/bat.nix
    ../../modules/home/bottom.nix
    ../../modules/home/direnv.nix
    ../../modules/home/git.nix
    ../../modules/home/helix.nix
    ../../modules/home/starship.nix
    ../../modules/home/zoxide.nix
    ../../modules/home/zsh.nix
  ];

  home.shellAliases = {
    lg = "lazygit";
    ldock = "lazydocker";
    cat = "bat";
  };

  home.file = {
    ".config/ghostty".source = mkDotfilesSymlink "config/ghostty";
    ".config/zellij".source = mkDotfilesSymlink "config/zellij";
    ".bashrc".source = mkDotfilesSymlink ".bashrc";
    ".config/zed".source = mkDotfilesSymlink "config/zed";
  };

  # Set your Home Manager state version.
  home.stateVersion = "25.05"; # Or your current version
}
