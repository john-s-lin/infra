{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lazydocker
    (if stdenv.isDarwin then nvtopPackages.apple else nvtopPackages.intel)
  ];
}
