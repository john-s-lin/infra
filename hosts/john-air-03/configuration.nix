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

  environment.variables = {
    EDITOR = "vim";
  };

  environment.systemPackages = [
    pkgs.vim
  ];

  system.stateVersion = 6;
}
