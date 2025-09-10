{ pkgs, config, ... }:
let
  username = "john";
  homeDir = config.users.users.${username}.home;
in
{
  environment.systemPackages = with pkgs; [
    rclone
  ];

  homebrew = {
    casks = [ "macfuse" ];
  };

  launchd.user.agents = {
    rclone-onedrive = {
      serviceConfig = {
        ProgramArguments = [
          "/bin/sh"
          "-c"
          "mkdir -p ${homeDir}/OneDrive && ${pkgs.rclone}/bin/rclone --vfs-cache-mode writes --config=${homeDir}/.config/rclone/rclone.conf --ignore-checksum mount OneDrive: ${homeDir}/OneDrive"
        ];
        RunAtLoad = true;
        KeepAlive = {
          Crashed = true;
          SuccessfulExit = false;
        };
        StandardOutPath = "${homeDir}/Library/Logs/rclone-onedrive.log";
        StandardErrorPath = "${homeDir}/Library/Logs/rclone-onedrive.err.log";
      };
    };
    rclone-gdrive = {
      serviceConfig = {
        ProgramArguments = [
          "/bin/sh"
          "-c"
          "mkdir -p ${homeDir}/GDrive && ${pkgs.rclone}/bin/rclone --vfs-cache-mode writes --config=${homeDir}/.config/rclone/rclone.conf --ignore-checksum mount GDrive: ${homeDir}/GDrive"
        ];
        RunAtLoad = true;
        KeepAlive = {
          Crashed = true;
          SuccessfulExit = false;
        };
        StandardOutPath = "${homeDir}/Library/Logs/rclone-gdrive.log";
        StandardErrorPath = "${homeDir}/Library/Logs/rclone-gdrive.err.log";
      };
    };
  };
}
