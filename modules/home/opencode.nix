{ ... }:
{
  xdg.configFile."opencode" = {
    source = ./opencode;
    recursive = true;
  };

  home.sessionVariables = {
    OPENCODE_ENABLE_EXA = 1;
  };
}
