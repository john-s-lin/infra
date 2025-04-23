{ config, pkgs, inputs, lib, ...}:

{
  options.cosmic.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable COSMIC DE";
  };

  config = lib.mkIf config.cosmic.enable {
    services.desktopManager.cosmic.enable = true;
    services.displayManager.cosmic-greeter.enable = true;
    environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  };
}
