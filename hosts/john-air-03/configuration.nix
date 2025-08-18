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

  system.stateVersion = 6;
}
