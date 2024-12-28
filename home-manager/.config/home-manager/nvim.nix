{ config, lib, pkgs, ... }: {

  xdg.configFile."nvim".source = /home/ro/playground/dotfiles/nvim;
  xdg.configFile."nvim".recursive = true;

  programs.neovim = {
    # enable = true;
    # package = pkgs.neovim-nightly;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.packages = [
    pkgs.tree-sitter
    pkgs.stylua
    pkgs.luaformatter
    pkgs.lua
    pkgs.lua52Packages.lua-lsp
    pkgs.ltex-ls
  ];

  programs.micro = {
    enable = true;
    settings = {
      autoindent = true;
      autosave = 10;
      autosu = false;
      clipboard = "external";
      cursorline = true;
      diffgutter = true;
      encoding = "utf-8";
      eofnewline = true;
      hlsearch = true;
      incsearch = true;
      infobar = true;
      matchbrace = true;
      mkparents = true;
      parsecursor = true;
      reload = "prompt";
      ruler = true;
      relativeruler = true;
      softwrap = true;
      statusline = true;
      syntax = true;
      # plugins
      autoclose = true;
      comment = true;
      linter = true;
      status = true;
      diff = true;
    };
  };
}
