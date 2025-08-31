{
  imports = [
    ../../modules/fonts.nix
    ../../modules/packages/default.nix
    ../../modules/packages/darwin/common.nix
    ../../modules/packages/darwin/mas.nix
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
