{ config, lib, pkgs, ... }: {

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      which-key-nvim
      telescope-nvim
      vimtex
      vim-nix
      nvim-treesitter.withAllGrammars
    ];
    extraLuaConfig = ''
       -- leader key
       vim.g.mapleader = ' '
       vim.g.maplocalleader = ' '

       -- line numbers
       vim.opt.number = true

      -- enable break indent
      vim.opt.breakindent = true

      -- save undo history
      vim.opt.undofile = true

      -- case-insensitive search
      vim.opt.ignorecase = true
      vim.opt.smartcase = true

      -- update time
      vim.opt.updatetime = 250

      -- popup display wait time
      vim.opt.timeoutlen = 300

      -- configure how new splits should be opened
      vim.opt.splitright = true
      vim.opt.splitbelow = true

      -- show cursor line
      vim.cursorline = true

      -- live substitutions
      vim.opt.inccommand = 'split'

      -- screen line buffer
      vim.opt.scrolloff = 10

      -- telescope
      config = function()
        require('telescope').setup{}
        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      end
    '';
  };

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

}
