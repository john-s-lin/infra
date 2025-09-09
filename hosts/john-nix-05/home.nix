{
  config,
  inputs,
  ...
}:
{
  imports = [
    # Packages
    ../../modules/packages/browsers.nix
    ../../modules/packages/developer.nix
    ../../modules/packages/personal.nix
    ../../modules/packages/work.nix

    # Config
    ../../modules/home/bat.nix
    ../../modules/home/bottom.nix
    ../../modules/home/direnv.nix
    ../../modules/home/git.nix
    ../../modules/home/ghostty.nix
    ../../modules/home/helix.nix
    ../../modules/home/rclone.nix
    ../../modules/home/starship.nix
    ../../modules/home/zed.nix
    ../../modules/home/zellij.nix
    ../../modules/home/zoxide.nix
    ../../modules/home/zsh.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "john";
  home.homeDirectory = "/home/john";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # This is being imported from the modules above
  # home.packages = with pkgs; [
  # ];

  # Aliases
  home.shellAliases = {
    lg = "lazygit";
    cat = "bat";
    zed = "zeditor";
  };

  # Enable XDG
  xdg.enable = true;

  # Environment variables to always set in every shell
  home.sessionVariables = {
    # Zoxide environment variables
    _ZO_DATA_DIR = "${config.home.homeDirectory}/.local/share";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/alacritty" = {
      source = "${inputs.dotfiles}/config/alacritty";
      recursive = true;
    };
    # Copy only the themes over. Zed configuration is covered by ../../modules/home/zed.nix
    ".config/zed/themes" = {
      source = "${inputs.dotfiles}/config/zed/themes";
      recursive = true;
    };
    ".config/ghostty/themes" = {
      source = "${inputs.dotfiles}/config/ghostty/themes";
      recursive = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
