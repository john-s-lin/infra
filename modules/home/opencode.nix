{ config, ... }:
let
  mkDotfilesSymlink = import ../../lib/dotfiles.nix { inherit config; };
in
{
  imports = [
    ./dotfiles.nix
  ];

  home = {
    file = {
      ".config/opencode".source = mkDotfilesSymlink "config/opencode";
    };
    sessionVariables = {
      OPENCODE_ENABLE_EXA = 1;
    };
  };
}
