{ config, lib, pkgs, ... }: {

  programs.micro = {
    enable = true;
    #catppuccin.enable = true;
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

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      # Example Plugin: vim-startify with configuration
      # {
      #   plugin = pkgs.vimPlugins.vim-startify;
      #   config = "let g:startify_change_to_vcs_root = 0";
      # }
      # {
      #   plugin = neorg;
      #   config = ''
      #     packadd! neorg
      #     lua << END
      #     require 'neorg'.setup{}
      #     END
      #   '';
      # }
    ];
    extraLuaConfig = "";
  };
  home.packages = [ pkgs.vimPlugins.neorg ];

  programs.helix = {
    enable = false;
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
