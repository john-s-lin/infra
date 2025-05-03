{ pkgs, ... }:
{
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      brlaser
    ];
  };

  # Enable sane backend to pick up scanner
  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [ sane-airscan ];
  };
}
