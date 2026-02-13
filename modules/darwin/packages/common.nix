{
  homebrew = {
    enable = true;
    casks = [
      "ghostty"
      "google-chrome"
      "obsidian"
      "rectangle"
      "zed"
      "zen"
    ];
    # Always upgrade casks
    greedyCasks = true;
    global.autoUpdate = false;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };
}
