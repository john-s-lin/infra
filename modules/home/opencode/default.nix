{ ... }:
{
  xdg.configFile."opencode" = {
    source = ./.;
    recursive = true;
  };

  home.sessionVariables = {
    OPENCODE_ENABLE_EXA = 1;
  };
}
