# infra

Everything is computer

## Bootstrap (First Time Setup)

Since `just` is installed via this Nix configuration, it won't be available on the first run. Use one of these methods to bootstrap:

### Option 1: Use `nix run` (Recommended)

Run `just` directly from nixpkgs without installing it:

```bash
# On macOS
nix run nixpkgs#just -- dr <hostname>

# On NixOS
nix run nixpkgs#just -- nr <hostname>
```

### Option 2: Use raw Nix commands

Bypass `just` entirely for the first rebuild:

```bash
# On macOS
sudo nix run nix-darwin -- switch --flake .#<hostname>

# On NixOS
sudo nixos-rebuild switch --flake .#<hostname>

# On Linux with Home Manager (standalone, non-NixOS)
nix run home-manager -- switch --flake .#<username>@<hostname>
```

After the first successful rebuild, `just` will be installed and available for all subsequent commands.

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

## Home Manager (Standalone Linux)

For standalone Home Manager on non-NixOS Linux systems (e.g., AlmaLinux, Ubuntu with Nix installed):

```bash
nix run home-manager -- switch --flake .#<username>@<hostname>
```

For example, to apply the configuration for `john@heimdall`:

```bash
nix run home-manager -- switch --flake .#john@heimdall
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
