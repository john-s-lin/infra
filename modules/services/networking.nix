{ ... }:
{
  networking = {
    hostName = "john-nix-05";
    networkmanager.enable = true;
    nameservers = [
      # "192.168.2.100"
      "1.1.1.3"
      "1.0.0.3"
    ];
  };

  # Allows detecting network-attached devices
  services.avahi.enable = true;

  # Enable tailscale
  services.tailscale.enable = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
