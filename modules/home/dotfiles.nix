{ config, lib, ... }:
{
  options.dotfiles = {
    path = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/.dotfiles";
      description = "Path to the local dotfiles repository for out-of-store symlinks.";
    };

    useSymlinks = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "When true, use out-of-store symlinks for live config updates. When false, configs are copied to the Nix store.";
    };
  };
}
