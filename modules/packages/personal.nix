{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.okular
    qbittorrent
    signal-desktop
    vesktop
    vlc
  ];
}
