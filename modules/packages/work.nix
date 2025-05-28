{ pkgs, ... }:
{
  home.packages = with pkgs; [
    naps2 # Document scanner
    obsidian
    thunderbird
    # thunderbird-esr
  ];
}
