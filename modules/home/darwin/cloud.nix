{
  pkgs,
  config,
  ...
}:

let
  gdrive_mount = "${config.home.homeDirectory}/GDrive";
  onedrive_mount = "${config.home.homeDirectory}/OneDrive";

  mkRcloneScript =
    name: remote: mountPoint:
    pkgs.writeShellScriptBin name ''
      #!${pkgs.runtimeShell}
      ${pkgs.coreutils}/bin/mkdir -p ${mountPoint}
      exec ${pkgs.rclone}/bin/rclone \
        --vfs-cache-mode writes \
        --ignore-checksum \
        --config=${config.xdg.configHome}/rclone/rclone.conf \
        mount ${remote}: ${mountPoint}
    '';
in
{
  home.packages = [ pkgs.rclone ];

  launchd.agents = {
    "rclone-gdrive" = {
      config = {
        Label = "rclone-gdrive";
        KeepAlive = true;
        RunAtLoad = true;
        Program = (mkRcloneScript "rclone-gdrive-start" "gdrive" gdrive_mount).outPath;
      };
    };
    "rclone-onedrive" = {
      config = {
        Label = "rclone-onedrive";
        KeepAlive = true;
        RunAtLoad = true;
        Program = (mkRcloneScript "rclone-onedrive-start" "onedrive" onedrive_mount).outPath;
      };
    };
  };
}
