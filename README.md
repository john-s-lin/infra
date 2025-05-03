# infra
Everything is computer

## NixOS

To rebuild, run

```bash
make nr HOSTNAME=<hostname>
```

## Home Manager

For `home-manager`, rebuilding is run through

```bash
make hm USER=<user>
```

## Garbage Collection

To collect garbage, run

```bash
make gc
```

## Additional Setup

### rclone

`rclone` is used to sync cloud storage to local drives. The configuration is pretty much ready to go, except you need to sign in to get access tokens to OneDrive and Google Drive.
Refer to [[./docs/cloud-storage.md]] for more info.
