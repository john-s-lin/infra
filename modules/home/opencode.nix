{ config, ... }:
{
  home.file = {
    ".config/opencode" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/opencode";
    };
  };
}
