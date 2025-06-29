HOSTNAME?=john-nix-05
GC_DAYS?=30

# Run nixos-rebuild
nr:
	sudo nixos-rebuild switch --flake .#$(HOSTNAME)

# Run garbage-collect
gc:
	nix-collect-garbage --delete-older-than $(GC_DAYS)d

# Run update
update:
	nix flake update
