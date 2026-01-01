{
  imports = [
    ../../modules/fonts.nix
    ../../modules/packages/default.nix
    ../../modules/darwin/packages/common.nix
    ../../modules/darwin/packages/ai.nix
    ../../modules/darwin/packages/axl.nix
    ../../modules/darwin/defaults.nix
    ../../modules/gc/darwin.nix
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
