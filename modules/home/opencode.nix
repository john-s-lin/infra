{ config, ... }:
{
  imports = [
    ./dotfiles.nix
  ];

  home.file = {
    ".config/opencode".source = config.lib.mkDotfilesSymlink "config/opencode";
  };
}
