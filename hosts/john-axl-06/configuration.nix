{
  imports = [
    ../../modules/fonts.nix
    ../../modules/packages/default.nix
    ../../modules/packages/darwin/common.nix
    ../../modules/packages/darwin/axl.nix
  ];

  # Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.john = {
    name = "john";
    home = "/Users/john";
  };

  system.primaryUser = "john";
  system.stateVersion = 6;
}
