{ pkgs, inputs, ... }:
{
  imports = [
    # Config
    ../../modules/home/bat.nix
    ../../modules/home/bottom.nix
    ../../modules/home/git.nix
    ../../modules/home/helix.nix
    ../../modules/home/starship.nix
    ../../modules/home/zed.nix
  ];

  # Make sure vim is installed for your user.
  home.packages = [
    pkgs.helix
  ];

  home.shellAliases = {
    lg = "lazygit";
    cat = "bat";
  };

  home.file = {
    ".config/ghostty" = {
      source = "${inputs.dotfiles}/config/ghostty";
      recursive = true;
    };
    ".config/zellij" = {
      source = "${inputs.dotfiles}/config/zellij";
      recursive = true;
    };
    ".bashrc" = {
      source = "${inputs.dotfiles}/.bashrc";
    };
    ".zshrc" = {
      source = "${inputs.dotfiles}/.zshrc";
    };
    ".config/zsh" = {
      source = "${inputs.dotfiles}/zsh";
      recursive = true;
    };
  };

  # Set your Home Manager state version.
  home.stateVersion = "25.05"; # Or your current version
}
