{
  nixvim,
  ...
}:
{
  imports = [
    ./keymaps.nix
    ./options.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    nixpkgs.useGlobalPackages = true;

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };
    luaLoader.enable = true;
  };
}
