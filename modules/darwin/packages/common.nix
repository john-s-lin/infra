{
  homebrew = {
    enable = true;
    casks = [
      "docker-desktop"
      "ghostty"
      "google-chrome"
      "obsidian"
      "rectangle"
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
      "lazydocker"
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
