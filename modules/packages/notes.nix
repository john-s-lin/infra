{ pkgs, ... }:
{
  users.users.john.packages = with pkgs; [
    obsidian
  ];
}
