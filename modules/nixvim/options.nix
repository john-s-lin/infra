{
  programs.nixvim = {
    globals = {
      autoformat = true;
      snacks_animate = true;
    };

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      updatetime = 100;

      # Line numbers
      relativenumber = true;
      number = true;

      cursorline = true;
      expandtab = true;
      fillchars = {
        foldopen = "";
        foldclose = "";
        fold = " ";
        foldsep = " ";
        diff = "╱";
        eob = " ";
      };
      foldlevel = 99;
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
      ignorecase = true;
      inccommand = "nosplit";
      jumpoptions = "view";
      linebreak = true;
      list = true;
      mouse = "a";
      pumblend = 10;
      pumheight = 10;
      ruler = false;
      scrolloff = 4;
      shiftwidth = 2;
      showmode = false;
      sidescrolloff = 8;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      spelllang = [ "en" ];
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      swapfile = false;
      tabstop = 2;
    };
  };
}
