{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bws
  ];
}