{ inputs, ... }:
{
  home.file = {
    ".config/opencode" = {
      source = "${inputs.dotfiles}/config/opencode";
      recursive = true;
    };
  };
}
