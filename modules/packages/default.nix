{
  pkgs,
  ...
}:
{
  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    nixfmt-rfc-style
    wl-clipboard
  ];
}
