{ pkgs, ... }:
let
  nixDeveloperPackages = with pkgs; [
    nil
    nixfmt
  ];
  defaultPackages = with pkgs; [
    git
    localsend
    vim
    wget
  ];
  linuxPackages = with pkgs; [
    wl-clipboard
  ];
in
{
  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    defaultPackages ++ nixDeveloperPackages ++ (if pkgs.stdenv.isLinux then linuxPackages else [ ]);
}
