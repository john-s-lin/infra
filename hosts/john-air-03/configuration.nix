{
  imports = [
    ../../modules/fonts.nix
    ../../modules/packages/default.nix
    ../../modules/darwin/packages/common.nix
    ../../modules/darwin/packages/mas.nix
    ../../modules/darwin/packages/personal.nix
    ../../modules/darwin/packages/rclone.nix
    ../../modules/darwin/packages/work.nix
    ../../modules/darwin/defaults.nix
    ../../modules/gc/darwin.nix
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
