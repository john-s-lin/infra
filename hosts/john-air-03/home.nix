{ ... }:
{
  imports = [
    # Common terminal tools
    ../../modules/home/common.nix
    ../../modules/home/workstation.nix

    # Additional config
    ../../modules/home/bash.nix
    ../../modules/home/ghostty.nix
    ../../modules/home/helix.nix
    ../../modules/home/opencode.nix
    ../../modules/home/zed.nix
    ../../modules/home/zsh.nix
  ];

  home.shellAliases = {
    lg = "lazygit";
    ldock = "lazydocker";
    cat = "bat";
  };

  home.username = "john";
  home.homeDirectory = "/Users/john";

  # Set your Home Manager state version.
  home.stateVersion = "25.05"; # Or your current version
}
