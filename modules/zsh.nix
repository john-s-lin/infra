# modules/zsh.nix
{
  pkgs,
  config,
  lib,
  inputs,
  dotfiles,
  ...
}:

{
  config = {
    programs.zsh = {
      enable = true;
      enableCompletions = true;

      # Enable Oh My Zsh integration
      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "zsh-autosuggestions"
          "zsh-syntax-highlighting"
        ];
      };
    };
  };
}
