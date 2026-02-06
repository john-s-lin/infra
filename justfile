# Default host names
darwin_host := "john-air-03"
nixos_host  := "john-nix-05"

# Run nixos-rebuild switch
nr host=nixos_host:
    sudo nixos-rebuild switch --flake .#{{host}}

# Run darwin-rebuild switch
dr host=darwin_host:
    sudo nix run nix-darwin -- switch --flake .#{{host}}

# Run garbage-collect (default 30 days)
gc days="30":
    sudo nix-collect-garbage --delete-older-than {{days}}d

# Update nix flake
update:
    nix flake update
