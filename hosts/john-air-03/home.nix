{ pkgs, inputs, ... }:
{
  # Set user-specific environment variables here. This will override the system.
  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Make sure vim is installed for your user.
  home.packages = [
    pkgs.helix
  ];

  # It is good practice to manage your shell with Home Manager.
  # For example, for zsh:
  programs.zsh.enable = true;

  home.file = {
    ".config" = {
      source = "${inputs.dotfiles}/config";
      recursive = true;
    };
    ".bashrc" = {
      source = "${inputs.dotfiles}/.bashrc";
    };
    ".zshrc" = {
      source = "${inputs.dotfiles}/.zshrc";
    };
    ".zshenv" = {
      text = ''
        . "$HOME/.cargo/env"

        # ZVM
        export ZVM_INSTALL="$HOME/.zvm/self"
        export PATH="$PATH:$HOME/.zvm/bin"
        export PATH="$PATH:$ZVM_INSTALL/"
      '';
    };
  };

  # Set your Home Manager state version.
  home.stateVersion = "25.05"; # Or your current version
}
