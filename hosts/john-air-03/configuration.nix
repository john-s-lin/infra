{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ../../modules/packages/homebrew.nix
  ];

  # Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.john = {
    name = "john.lin";
    home = "/Users/john.lin";
  };

  system.primaryUser = "john.lin";
  system.stateVersion = 6;
}
