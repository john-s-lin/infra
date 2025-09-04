{
  imports = [
    ../../modules/fonts.nix
    ../../modules/packages/default.nix
    ../../modules/packages/darwin/common.nix
    ../../modules/packages/darwin/ai.nix
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

  system.defaults = {
    dock = {
      orientation = "left";
      tilesize = 36;
    };

    WindowManager = {
      EnableTilingByEdgeDrag = false;
      EnableTiledWindowMargins = false;
      EnableTopTilingByEdgeDrag = false;
      EnableTilingOptionAccelerator = false;
    };

    finder = {
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    NSGlobalDomain = {
      AppleShowAllExtensions = true;
    };

    ".GlobalPreferences" = {
      # -1.0 is no mouse acceleration
      "com.apple.mouse.scaling" = -1.0;
    };
  };

  system.primaryUser = "john";
  system.stateVersion = 6;
}
