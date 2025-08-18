{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.john = {
    name = "john.lin";
    home = "/Users/john.lin";
  };

  system.stateVersion = 6;
}
