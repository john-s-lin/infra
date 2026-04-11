{ username, ... }:
{
  imports = [
    ../../modules/fonts.nix

    ../../modules/packages/default.nix

    ../../modules/darwin/defaults.nix

    ../../modules/darwin/packages/common.nix

    ../../modules/gc/darwin.nix
  ];

  # patch: will work with Determinate Nix install
  # nix.enable = false;

  # Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  system.primaryUser = username;
  system.stateVersion = 6;
}
