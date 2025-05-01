{ pkgs, ... }:
{
  users.users.john.packages = with pkgs; [
    qbittorrent
    signal-desktop
    vlc
  ];
}
