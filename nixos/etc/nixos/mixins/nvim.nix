{ inputs, ... }:
{
  imports = [
    inputs.nixvim.nixosModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    enableMan = false;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    waylandSupport = true;
    editorconfig.enable = false;
    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        plugins = true;
      };
    };
    colorschemes = {
      bamboo = {
        enable = true;
        settings = {
          style = "multiplex"; # vulgaris, light, multiplex
          transparent = true;
        };
      };
      catppuccin = {
        enable = false;
        settings = {
          flavour = "frappe";
        };
      };
    };
    globals = {
      localleader = " ";
      mapleader = " ";
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>gg";
        action = ":LazyGit<CR>";
        options = {
          desc = "LazyGit status";
        };
      }
    ];
    opts = {
      cursorline = true;
      showmode = false;
      number = true;
      confirm = true;
      clipboard = "unnamedplus";
      breakindent = true;
      autoindent = true;
      smartindent = true;
      smarttab = true;
      softtabstop = 2;
      tabstop = 2;
      shiftwidth = 2;
      wrap = true;
      linebreak = true;
      hidden = true;
      gdefault = true;
      lazyredraw = true;
      swapfile = false;
      backup = false;
      writebackup = false;
      undofile = true;
      relativenumber = true;
      hlsearch = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true;
      list = true;
      signcolumn = "yes";
      updatetime = 150;
      timeoutlen = 250;
      scrolloff = 8;
      mouse = "a";
      splitbelow = true;
      splitright = true;
      autoread = true;
    };
    diagnostic = {
      settings = {
        virtual_lines = {
          current_line = true;
        };
        virtual_text = false;
      };
    };
    plugins = {
      mini = {
        enable = true;
        mockDevIcons = true;
        modules = {
          icons = {
            style = "glyph";
          };
        };
      };
      mini-statusline = {
        enable = true;
        settings = {
          use_icons = true;
        };
      };
      mini-pairs = {
        enable = true;
      };
      mini-notify = {
        enable = true;
      };
      mini-comment = {
        enable = true;
      };
      mini-ai = {
        enable = true;
      };
      treesitter = {
        enable = true;
      };
      lazygit = {
        # alternative: neogit
        enable = true;
      };
      trouble = {
        enable = true;
      };
      luasnip = {
        enable = true;
      };
      gitsigns = {
        enable = true;
      };
      which-key = {
        enable = true;
      };
      telescope = {
        enable = true;
        extensions = {
          fzf-native = {
            enable = true;
          };
        };
        settings = {
          defaults = {
            selection_caret = "  ";
            entry_prefix = "  ";
            layout_strategy = "flex";
            layout_config = {
              horizontal = {
                prompt_position = "top";
              };
            };
            sorting_strategy = "ascending";
          };
          pickers = {
            colorscheme = {
              enable_preview = true;
            };
          };
        };
        keymaps = {
          "<leader>sh" = {
            action = "help_tags";
            options = {
              desc = "[S]earch [H]elp";
            };
          };
          "<leader><leader>" = {
            action = "buffers";
            options = {
              desc = "[ ] Find existing buffers";
            };
          };
          "<leader>sk" = {
            action = "keymaps";
            options = {
              desc = "[S]earch [K]eymaps";
            };
          };
          "<leader>sf" = {
            action = "find_files";
            options = {
              desc = "[S]earch [F]iles";
            };
          };
          "<leader>ss" = {
            action = "builtin";
            options = {
              desc = "[S]earch [S]elect Telescope";
            };
          };
          "<leader>sw" = {
            action = "grep_string";
            options = {
              desc = "[S]earch current [W]ord";
            };
          };
          "<leader>sg" = {
            action = "live_grep";
            options = {
              desc = "[S]earch by [G]rep";
            };
          };
          "<leader>sd" = {
            action = "diagnostics";
            options = {
              desc = "[S]earch [D]iagnostics";
            };
          };
          "<leader>s." = {
            action = "oldfiles";
            options = {
              desc = "[S]earch recent files";
            };
          };
          "<leader>sr" = {
            action = "resume";
            options = {
              desc = "[S]earch [R]esume";
            };
          };
        };
      };
      todo-comments = {
        enable = true;
      };
      lint = {
        enable = true;
        lintersByFt = {
          bash = [ "shellcheck" ];
          sh = [ "shellcheck" ];
        };
      };
      lsp = {
        enable = true;
        autoLoad = true;
        inlayHints = true;
        servers = {
          nixd = {
            enable = true;
          };
          gopls = {
            enable = true;
          };
          lua_ls = {
            enable = true;
          };
          clojure_lsp = {
            enable = true;
          };
          omnisharp = {
            enable = true;
            cmd = [
              "OmniSharp"
              "-lsp"
            ];
          };
          beancount = {
            enable = false;
          };
        };
      };
      blink-cmp = {
        enable = true;
        autoLoad = true;
        setupLspCapabilities = true;
        settings.sources.default = [
          "lsp"
          "path"
          "buffer"
        ];
      };
      conform-nvim = {
        enable = true;
        settings = {
          notify_no_formatters = true;
          notify_on_error = true;
          log_level = "warn";
          formatters_by_ft = {
            nix = [ "nixfmt" ];
            bash = [ "shfmt" ];
            sh = [ "shfmt" ];
            fsharp = [ "fantomas" ];
            lua = {
              __unkeyed-1 = "stylua";
              __unkeyed-2 = "lua-format";
              stop_after_first = true;
            };
            cs = [ "csharpier" ];
            clojure = [ "cljfmt" ];
            go = {
              __unkeyed-1 = "goimports";
              __unkeyed-2 = "gofmt";
              stop_after_first = true;
            };
            python = {
              __unkeyed-1 = "isort";
              __unkeyed-2 = "black";
              stop_after_first = false;
            };
            rust = [ "rustfmt" ];
            html = [ "tidy -m" ];
            javascript = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
          };
          format_on_save = {
            timeout_ms = 1000;
            lsp_format = "prefer";
          };
        };
      };
    };
  };
}
