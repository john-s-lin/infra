{ pkgs, ... }:
{
  home.packages = with pkgs; [
    papers
    qbittorrent
    signal-desktop
    vesktop
    vlc
  ];
}
