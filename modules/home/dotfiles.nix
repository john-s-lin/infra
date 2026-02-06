{ config, lib, ... }:
let
  cfg = config.dotfiles;
in
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

  # Inject mkDotfilesSymlink as a module argument for all modules to use
  _module.args.mkDotfilesSymlink =
    subpath:
    if cfg.useSymlinks then
      config.lib.file.mkOutOfStoreSymlink "${cfg.path}/${subpath}"
    else
      "${cfg.path}/${subpath}";
}
