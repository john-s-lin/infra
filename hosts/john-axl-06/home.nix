{ pkgs, inputs, ... }:
{
  imports = [
    # Config
    ../../modules/home/bat.nix
    ../../modules/home/bottom.nix
    ../../modules/home/git.nix
    ../../modules/home/helix.nix
    ../../modules/home/starship.nix
    ../../modules/home/zoxide.nix
    ../../modules/home/zsh.nix
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
    ".config/zed" = {
      source = "${inputs.dotfiles}/config/zed";
      recursive = true;
    };
  };

  # Set your Home Manager state version.
  programs.zsh.initExtra = ''
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';

  home.stateVersion = "25.05"; # Or your current version
}
