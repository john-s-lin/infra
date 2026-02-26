{
  pkgs,
  config,
  ...
}:
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
    ../../modules/home/helix.nix
    ../../modules/home/opencode.nix
    ../../modules/home/zed.nix
    ../../modules/home/zsh.nix
  ];

  # Make sure vim is installed for your user.
  home.packages = [
    pkgs.helix
  ];

  home.shellAliases = {
    lg = "lazygit";
    ldock = "lazydocker";
    cat = "bat";
  };

  home.username = "john";
  home.homeDirectory = "/Users/john";

  home.file = {
    ".config/ghostty".source = mkDotfilesSymlink "config/ghostty";
    ".bashrc".source = mkDotfilesSymlink ".bashrc";
  };

  # Set your Home Manager state version.
  home.stateVersion = "25.05"; # Or your current version
}
