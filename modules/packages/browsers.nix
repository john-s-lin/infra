{
  inputs,
  pkgs,
  system,
  ...
}:
{
  home.packages = with pkgs; [
    google-chrome
    inputs.zen-browser.packages."${system}".twilight
  ];
}
