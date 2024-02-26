{ config, lib, pkgs, ... }: {

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

  programs.neovim = { enable = true; };

  programs.helix = {
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        scrolloff = 5;
        cursorline = true;
        auto-save = true;
        bufferline = "always";
      };
    };
  };
}
