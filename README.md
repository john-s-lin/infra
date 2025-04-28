# infra
Everything is computer

## NixOS

To rebuild, run

```bash
nixos-rebuild switch --flake .#${hostname}
```

## Home Manager

For `home-manager`, rebuilding is run through

```bash
home-manager switch --flake .
```
