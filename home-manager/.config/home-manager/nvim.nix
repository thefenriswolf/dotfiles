{ config, lib, pkgs, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
    ref = "nixos-24.05";
  });
in {

  imports = [
    # For home-manager
    nixvim.homeManagerModules.nixvim
  ];

  home.packages = [ ];

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

  programs.nixvim = {
    enable = true;
    # set leader key
    globals.mapleader = " ";
    # THEME
    colorschemes.cyberdream = {
      enable = false;
      settings = {
        borderless_telescope = true;
        italic_comments = true;
        terminal_colors = true;
        transparent = true;
      };
    };
    # PLUGINS
    plugins = {
      # alpha greeter
      alpha.enable = true;
      alpha.theme = "dashboard";
      # autoclose
      autoclose.enable = true;
      # barbar
      barbar.enable = true;
      # completion
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
          snippet = { expand = "luasnip"; };
          mapping = {
            # ...
          };
        };
      };
      # toggle comments
      comment.enable = true;
      # indent lines
      indent-blankline.enable = true;
      # lualine status line
      lualine.enable = true;
      # Luasnip snippets
      luasnip.enable = true;
      # lsp
      lsp = {
        enable = true;
        servers = {
          rust-analyzer = { # Rust
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          lua-ls.enable = true; # Lua
          tsserver.enable = false; # Typescript
          nixd.enable = true; # Nix
          pylsp.enable = true; # Python
          ruff-lsp.enable = true; # Python formatter
          html.enable = false; # HTML
          jsonls.enable = false; # JSON
          svelte.enable = false; # Svelte
          typst-lsp = { # Typst
            enable = false;
            extraOptions.settings.exportPdf = "onType";
          };
          yamlls.enable = false; # YAML
        };
      };
      # show lsp diagnostics in extra lines
      lsp-lines.enable = true;
      # nvim-tree file explorer
      nvim-tree.enable = true;
      # Color matching start and end symbols
      rainbow-delimiters.enable = true;
      # automatically detect tabstop and shiftwidth
      sleuth.enable = true;
      # search and replace
      spectre.enable = false;
      # Telescope
      telescope.enable = true;
      # Special comments
      todo-comments.enable = false;
      # Integrated terminal
      toggleterm = {
        enable = false;
        settings = {
          direction = "horizontal";
          autochdir = true;
        };
        #openMapping = "<leader>t";
      };
      # Treesitter
      treesitter.enable = true;
      treesitter.ensureInstalled = "all";
      # css color preview
      vim-css-color.enable = true;
      # keymap overview
      which-key = {
        enable = false;
        registrations = {
          "<leader>f" = " Find";
          "<leader>d" = " Debug";
          "<leader>g" = "󰊢 Git";
          "<leader>l" = " LSP";
          "<leader>t" = " Terminal";
        };
      };
    };
    # KEYMAPS...
    # AUTOCMD...
    # VIM OPTIONS...
    # EXTRACONFIG...
  };

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
