{ ... }:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ]; # Apply to all keyboards
        settings = {
          main = {
            # Caps Lock: tap for Esc, hold for Ctrl (matches your evremap config)
            capslock = "overload(control, esc)";

            # Swap Alt and Meta keys (matches your evremap config)
            leftalt = "leftmeta";
            rightalt = "rightmeta";
            leftmeta = "leftalt";
          };
        };
        # Optional: Adjust timing for tap-hold behavior
        extraConfig = ''
          [main]
          overload_tap_timeout = 200
        '';
      };
    };
  };
}
