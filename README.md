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

## Updating

Updating is as easy as

```bash
make update
```

## Additional Setup

### rclone

`rclone` is used to sync cloud storage to local drives. The configuration is pretty much ready to go, except you need to sign in to get access tokens to OneDrive and Google Drive.
Refer to [docs/cloud-storage.md](./docs/cloud-storage.md) for more info.
