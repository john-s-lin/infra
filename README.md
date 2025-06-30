# infra

Everything is computer

## NixOS

To rebuild, run

```bash
make nr HOSTNAME=<hostname>
```

## Garbage Collection

To collect garbage, run

```bash
make gc
```

## Updating Packages

Updating packages is as easy as

```bash
make update
```

which will update your `flake.lock` file.

## Additional Setup

### rclone

`rclone` is used to sync cloud storage to local drives. The configuration is pretty much ready to go, except you need to sign in to get access tokens to OneDrive and Google Drive.
Refer to [docs/cloud-storage.md](./docs/cloud-storage.md) for more info.
