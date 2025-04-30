HOSTNAME?=john-nix-05
USER?=john
GC_DAYS?=30

# Run nixos-rebuild
nr:
	sudo nixos-rebuild switch --flake .#$(HOSTNAME)

# Run home-manager
hm:
	home-manager switch --flake .#$(USER)

# Run garbage-collect
gc:
	nix-collect-garbage --delete-older-than $(GC_DAYS)d
