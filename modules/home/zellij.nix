{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      theme = "tokyo-night-dark";
      pane_frames = false;
      copy_command = "wl-copy";
    };
  };
}
