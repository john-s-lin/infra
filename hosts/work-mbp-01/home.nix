{ username, ... }:
{
  imports = [
    # Common terminal tools (previously in common.nix)
    ../../modules/home/bat.nix
    ../../modules/home/bottom.nix
    ../../modules/home/direnv.nix
    ../../modules/home/git.nix
    ../../modules/home/jujutsu.nix

    # Workstation tools (previously in workstation.nix)
    ../../modules/home/starship.nix
    ../../modules/home/zellij.nix
    ../../modules/home/zoxide.nix

    # Additional config
    ../../modules/home/bash.nix
    ../../modules/home/ghostty.nix
    ../../modules/home/helix.nix
    ../../modules/home/zsh.nix

    # Terminal packages
    ../../modules/packages/terminal.nix
    ../../modules/packages/workstation.nix
  ];

  home.shellAliases = {
    lg = "lazygit";
    ldock = "lazydocker";
    cat = "bat";
  };

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
    "/etc/profiles/per-user/${username}/bin"
  ];

  programs.ssh.forwardAgent = true;

  home.username = username;
  home.homeDirectory = "/Users/${username}";

  home.stateVersion = "26.05";
}
