{ config, ... }:
{
  programs.jujutsu = {
    enable = true;

    settings = {
      # Enable color output
      ui.color = "auto";
    };
  };
}
