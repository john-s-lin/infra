{
  nixvim,
  ...
}:
{
  imports = [
    nixvim.homeManagerModules.nixvim
    ./keymaps.nix
    ./options.nix
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
