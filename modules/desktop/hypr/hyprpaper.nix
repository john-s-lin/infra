{ secondMonitor, ... }:

let
  wallpaperPrimary = ./wallpapers/new-zealand-01.jpg;
  wallpaperSecondary = ./wallpapers/tokyo-01.jpg;
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "${wallpaperPrimary}"
        "${wallpaperSecondary}"
      ];
      wallpaper = [
        "eDP-1, ${wallpaperPrimary}"
        "${secondMonitor}, ${wallpaperSecondary}"
      ];
    };
  };
}
