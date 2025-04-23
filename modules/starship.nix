{
  dotfiles,
  pkgs,
  config,
  lib,
  ...
}:
{
  home.programs.starship.enable = true;

  # Refer to dotfiles
  home.file.".config/starship" = {
    source = "${dotfiles}/config/starship";
    recursive = true;
  };
}
