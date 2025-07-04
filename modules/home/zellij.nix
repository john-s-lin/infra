{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      theme = "tokyo-night-dark";
      pane_frames = true;
      copy_command = "wl-copy";
    };
  };
}
