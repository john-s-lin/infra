{ mkDotfilesSymlink, ... }:
{
  imports = [
    ./dotfiles.nix
  ];

  home.file = {
    ".config/opencode".source = mkDotfilesSymlink "config/opencode";
  };
}
