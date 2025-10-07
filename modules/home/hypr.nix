{ inputs, ... }:
{
  home.file = {
    ".config/hypr" = {
      source = "${inputs.dotfiles}/config/hypr";
      recursive = true;
    };
  };
}
