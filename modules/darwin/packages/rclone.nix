{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rclone
  ];

  homebrew = {
    casks = [ "macfuse" ];
  };
}
