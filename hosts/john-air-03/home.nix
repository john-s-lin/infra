{ config, ... }:
let
  mkDotfilesSymlink = import ../../lib/dotfiles.nix { inherit config; };
in
{
  imports = [
    # Dotfiles configuration
    ../../modules/home/dotfiles.nix

    # Common terminal tools
    ../../modules/home/common.nix
    ../../modules/home/workstation.nix

    # Additional config
    ../../modules/home/ghostty.nix
    ../../modules/home/zed.nix
    ../../modules/home/helix.nix
    ../../modules/home/opencode.nix
    ../../modules/home/zsh.nix
  ];

  home.shellAliases = {
    lg = "lazygit";
    ldock = "lazydocker";
    cat = "bat";
  };

  home.username = "john";
  home.homeDirectory = "/Users/john";

  home.file = {
    ".bashrc".source = mkDotfilesSymlink ".bashrc";
    ".config/ghostty/themes/tokyo-passion.ghostty".source =
      ../../modules/home/ghostty/themes/tokyo-passion.ghostty;
  };

  # Set your Home Manager state version.
  home.stateVersion = "25.05"; # Or your current version
}
