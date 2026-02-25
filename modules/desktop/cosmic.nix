{ pkgs, ... }:
{
  services = {
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
  };

  # Exclude COSMIC apps that duplicate existing tools
  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit # using Helix/Zed
    cosmic-term # using Ghostty
    cosmic-player # using VLC
  ];
}
