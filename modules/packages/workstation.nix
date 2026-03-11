{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (if stdenv.isDarwin then nvtopPackages.apple else nvtopPackages.intel)
  ];
}
