{
  config,
  pkgs,
  ...
}:
let
  mkDotfilesSymlink = import ../../lib/dotfiles.nix { inherit config; };
in
{
  imports = [
    # Dotfiles configuration
    ../../modules/home/dotfiles.nix

    # Common terminal tools (shared across all hosts)
    ../../modules/home/common.nix
    ../../modules/home/workstation.nix

    # Additional packages
    ../../modules/packages/ai.nix
    ../../modules/packages/browsers.nix
    ../../modules/packages/developer.nix
    ../../modules/packages/personal.nix
    ../../modules/packages/work.nix

    # Desktop
    ../../modules/desktop/hypr/default.nix

    # Host-specific config
    ../../modules/home/alacritty.nix
    ../../modules/home/zed.nix
    ../../modules/home/ghostty.nix
    ../../modules/home/helix.nix
    ../../modules/home/opencode.nix
    ../../modules/home/rclone.nix
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
    ldock = "lazydocker";
    cat = "bat";
    zed = "zeditor";
  };

  # Enable XDG
  xdg.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/ghostty/themes/tokyo-passion.ghostty".source =
      ../../modules/home/ghostty/themes/tokyo-passion.ghostty;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
