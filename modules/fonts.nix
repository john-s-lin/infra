{ pkgs, ... }:
let
  commonFonts = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.geist-mono
    geist-font
  ];
  linuxFonts = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts
    noto-fonts-emoji
    font-awesome
    source-han-sans
  ];
in
{
  fonts.packages = if pkgs.stdenv.isLinux then commonFonts ++ linuxFonts else commonFonts;
}
