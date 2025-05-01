{
  config,
  pkgs,
  ...
}:
{
  imports = [ ../../modules/home/zsh.nix ];

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

  # Starship
  programs.starship = {
    enable = true;
    settings = {
      format = "$time$directory$python$rust$zig$git_branch$git_commit$git_state$git_status$cmd_duration$character";
      add_newline = false;

      time = {
        format = "[\\[$time\\]](\$style) ";
        style = "cyan";
        disabled = false;
      };

      directory = {
        format = "[\\[$path\\]](\$style) ";
        style = "cyan";
        truncation_symbol = ".../";
        truncate_to_repo = false;
      };

      cmd_duration = {
        min_time = 50;
        show_milliseconds = true;
        style = "yellow";
      };

      python = {
        format = "[\\((\$version)( \$virtualenv)\\)](\$style) ";
        style = "green";
      };

      rust = {
        format = "[\\((\$version)\\)](\$style) ";
        style = "red";
      };

      zig = {
        format = "[\\((\$version)\\)](\$style) ";
        style = "yellow";
      };

      git_branch = {
        format = "[\\[$branch(:\$remote_branch)\\]](\$style) ";
        style = "purple";
      };

      git_status = {
        style = "bold purple";
      };
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
