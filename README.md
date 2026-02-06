# infra

Everything is computer

## NixOS

To rebuild, run

```bash
just nr <hostname>
```

## macOS

To rebuild, run

```bash
just dr <hostname>
```

## Garbage Collection

To collect garbage, run

```bash
just gc
```

Default is 30 days. To specify a different number of days:

```bash
just gc <days>
```

## Updating Packages

Updating packages is as easy as

```bash
just update
```

which will update your `flake.lock` file.

## Validation

To validate the flake configuration before applying changes, run

```bash
just check
```

This runs `nix flake check` to verify the configuration is valid.

## Additional Setup

### rclone

`rclone` is used to sync cloud storage to local drives. The configuration is pretty much ready to go, except you need to sign in to get access tokens to OneDrive and Google Drive.
Refer to [docs/cloud-storage.md](./docs/cloud-storage.md) for more info.
