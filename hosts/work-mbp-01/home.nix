{
  imports = [
    ../../modules/home/bat.nix
    ../../modules/home/bottom.nix
    ../../modules/home/direnv.nix
    ../../modules/home/git.nix
    ../../modules/home/jujutsu.nix
    ../../modules/home/starship.nix
    ../../modules/home/zoxide.nix
    ../../modules/home/bash.nix
    ../../modules/home/helix.nix
    ../../modules/home/zsh.nix
    ../../modules/packages/terminal.nix
  ];

  home.shellAliases = {
    lg = "lazygit";
    cat = "bat";
  };

  home.username = "johnslin";
  home.homeDirectory = "/Users/johnslin";
  home.stateVersion = "25.05";
}
