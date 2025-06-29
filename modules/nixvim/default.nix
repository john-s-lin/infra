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
    defaultEditor = true;

    nixpkgs.useGlobalPackages = true;

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };

    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
  };
}
