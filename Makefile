DARWIN?=john-air-03
NIX?=john-nix-05
GC_DAYS?=30

# Run nixos-rebuild
nr:
	sudo nixos-rebuild switch --flake .#$(NIX)

# darwin-rebuild
dr:
	sudo nix run nix-darwin -- switch --flake .#$(DARWIN)

# Run garbage-collect
gc:
	nix-collect-garbage --delete-older-than $(GC_DAYS)d

# Run update
update:
	nix flake update
