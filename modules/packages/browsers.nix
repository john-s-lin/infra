{
  inputs,
  pkgs,
  system,
  ...
}:
{
  users.users.john.packages = with pkgs; [
    google-chrome
    inputs.zen-browser.packages."${system}".twilight
  ];
}
