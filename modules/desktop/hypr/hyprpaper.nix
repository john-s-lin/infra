let
  secondMonitor = "DP-2";
  wallpaperPrimary = ./wallpapers/new-zealand-01.jpg;
  wallpaperSecondary = ./wallpapers/tokyo-01.jpg;
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        {
          monitor = "eDP-1";
          path = "${wallpaperPrimary}";
        }
        {
          monitor = secondMonitor;
          path = "${wallpaperSecondary}";
        }
      ];
    };
  };
}
