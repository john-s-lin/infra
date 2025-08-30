{ pkgs, ... }:
{
  homebrew = {
    enable = true;
    casks = [
      "discord"
      "docker-desktop"
      "ghostty"
      "google-chrome"
      "linear-linear"
      "obsidian"
      "rectangle"
      "spotify"
      "vlc"
      "zed"
      "zen"
    ];
    # Always upgrade casks
    greedyCasks = true;
    brews = [
      "bat"
      "bottom"
      "fd"
      "fzf"
      "hyperfine"
      "lazygit"
      "nvtop"
      "rename"
      "ripgrep"
      "starship"
      "tree"
      "zellij"
      "zoxide"
    ];
    global.autoUpdate = false;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };
}
