{ pkgs, inputs, ... }:
{
  home.file = {
    ".config/hypr" = {
      source = "${inputs.dotfiles}/config/hypr";
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    rofi
    waybar
  ];
}
