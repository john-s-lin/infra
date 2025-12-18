{ pkgs, config, ... }:
let
  gdrive_mount = "${config.home.homeDirectory}/GDrive";
  onedrive_mount = "${config.home.homeDirectory}/OneDrive";
in
{
  home.packages = with pkgs; [
    rclone
    fuse3
  ];

  systemd.user.services = {
    rclone-gdrive = {
      Unit = {
        Description = "rclone mount for Google Drive";
        After = [ "network-online.target" ];
      };

      Service = {
        Type = "notify";
        ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${gdrive_mount}";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone\
          --vfs-cache-mode writes\
          --no-xattr\
          --ignore-checksum\
          --config=${config.xdg.configHome}/rclone/rclone.conf\
          mount gdrive: ${gdrive_mount}
        '';
        ExecStop = "${pkgs.fuse3}/bin/fusermount -u ${gdrive_mount}";
        Restart = "on-failure";
        RestartSec = 10;
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };

    rclone-onedrive = {
      Unit = {
        Description = "rclone mount for OneDrive";
        After = [ "network-online.target" ];
      };

      Service = {
        Type = "notify";
        ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${onedrive_mount}";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone\
          --vfs-cache-mode writes\
          --no-xattr\
          --ignore-checksum\
          --config=${config.xdg.configHome}/rclone/rclone.conf\
          mount onedrive: ${onedrive_mount}
        '';
        ExecStop = "${pkgs.fuse3}/bin/fusermount -u ${onedrive_mount}";
        Restart = "on-failure";
        RestartSec = 10;
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
