HOSTNAME?=narsil
USER?=john

# Run nixos-rebuild
nr:
	sudo nixos-rebuild switch --flake .#$(HOSTNAME)

# Run home-manager
hm:
	home-manager switch --flake .#$(USER)
