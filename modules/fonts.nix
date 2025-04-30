{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.geist-mono
    geist-font
    noto-fonts-cjk-sans
    noto-fonts
    noto-fonts-emoji
    font-awesome
    source-han-sans
  ];
}
