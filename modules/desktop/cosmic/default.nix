{ pkgs, ... }:
{
  # Ensure cosmic.portal is in the per-user profile so xdg-desktop-portal
  # can discover it. The per-user portals/ directory (populated by the
  # Hyprland HM module) shadows the system one, so xdg-desktop-portal-cosmic
  # must be present here too.
  home.packages = with pkgs; [
    xdg-desktop-portal-cosmic
  ];
}
