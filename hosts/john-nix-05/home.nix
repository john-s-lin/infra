{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../../modules/home/starship.nix
    ../../modules/home/tmux.nix
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
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
  ];

  # Enable XDG
  xdg.enable = true;

  # Environment variables to always set in every shell
  home.sessionVariables = {
    # Zoxide environment variables
    _ZO_DATA_DIR = "${config.home.homeDirectory}/.local/share";
    EDITOR = "vim";
  };

  # Git
  programs.git = {
    enable = true;
    includes = [ { path = "~/.gitconfig.local"; } ];
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      pager = {
        branch = false;
      };
      push = {
        autoSetupRemote = true;
      };
      gpg = {
        format = "ssh";
      };
      pull = {
        rebase = true;
      };
    };
  };

  # Zoxide
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
