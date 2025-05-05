{
  nixvim,
  ...
}:
{
  imports = [ nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };
  };
}
