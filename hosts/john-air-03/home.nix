{ pkgs, ... }:
{
  # Set user-specific environment variables here. This will override the system.
  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Make sure vim is installed for your user.
  home.packages = [
    pkgs.helix
  ];

  # It is good practice to manage your shell with Home Manager.
  # For example, for zsh:
  programs.zsh.enable = true;

  # Set your Home Manager state version.
  home.stateVersion = "25.05"; # Or your current version
}
