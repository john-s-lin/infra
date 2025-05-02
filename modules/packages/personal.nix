{ pkgs, ... }:
{
  home.packages = with pkgs; [
    qbittorrent
    signal-desktop
    vlc
  ];
}
