# Helper function for creating dotfiles symlinks
# Usage: mkDotfilesSymlink { config } "config/app"
{ config }:
subpath:
let
  cfg = config.dotfiles;
in
if cfg.useSymlinks then
  config.lib.file.mkOutOfStoreSymlink "${cfg.path}/${subpath}"
else
  "${cfg.path}/${subpath}"
