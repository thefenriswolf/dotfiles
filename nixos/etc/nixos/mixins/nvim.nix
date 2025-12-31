{
  inputs,
  lib,
  pkgs,
  ...
}:
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

    #  extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
    #    name = "my-plugin";
    #    src = pkgs.fetchFromGitHub {
    #        owner = "<owner>";
    #        repo = "<repo>";
    #        rev = "<commit hash>";
    #        hash = "<nix NAR hash>";
    #    };
    #  })];

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
      ## LazyGit
      {
        mode = "n";
        key = "<leader>g";
        action = "";
        options = {
          desc = "[G]it";
        };
      }
      {
        mode = "n";
        key = "<leader>gs";
        action = ":LazyGit<CR>";
        options = {
          desc = "LazyGit [S]tatus";
        };
      }
      {
        mode = "n";
        key = "<leader>gl";
        action = ":LazyGitLog<CR>";
        options = {
          desc = "LazyGit [L]og";
        };
      }
      ## Debugger
      {
        mode = "n";
        key = "<leader>l";
        action = "";
        options = {
          desc = "Debugger";
        };
      }
      {
        mode = "n";
        key = "<leader>lb";
        action = ":DapToggleBreakpoint<CR>";
        options = {
          desc = "Toggle [B]reakpoint";
        };
      }
      {
        mode = "n";
        key = "<leader>le";
        action.__raw = ''
          				function()
                      require("dap").set_exception_breakpoints({"all"})
          				end
          				'';
        options = {
          desc = "Set [E]xception Breakpoints";
        };
      }
      {
        mode = "n";
        key = "<leader>lc";
        action = ":DapContinue<CR>";
        options = {
          desc = "[C]ontinue";
        };
      }
      {
        mode = "n";
        key = "<leader>ll";
        action.__raw = ''
          				function()
                      require("dap").list_breakpoints()
          				end
          				'';
        options = {
          desc = "[L]ist Breakpoints";
        };
      }
      {
        mode = "n";
        key = "<leader>lr";
        action.__raw = ''
          function()
              require("dap").repl.toggle()
          end
        '';
        options = {
          desc = "Open/Close [R]EPL";
        };
      }
      {
        mode = "n";
        key = "<leader>lv";
        action = ":DapViewToggle<CR>";
        options = {
          desc = "Open/Close Dap[V]iew";
        };
      }
      {
        mode = "n";
        key = "<leader>lq";
        action.__raw = ''
          function()
            require("dap").terminate()
            require("dap-view").close()
            require("dapui").close()
          end
        '';
        options = {
          desc = "[Q]uit";
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
      hardtime.enable = true;
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
      # https://nix-community.github.io/nixvim/plugins/dap/index.html
      # https://github.com/igorlfs/nvim-dap-view/
      # https://tamerlan.dev/a-guide-to-debugging-applications-in-neovim/
      # https://github.com/search?q=repo%3Akhaneliman%2Fkhanelivim+dap&type=code&p=2
      # https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#c-c-rust-via-lldb-vscode
      dap = {
        enable = true;
        adapters = {
          executables = {
            lldb = {
              command = lib.getExe' pkgs.lldb "lldb-dap";
              #args = ["-g"];
            };
          };
        };
        configurations = {
          odin = [
            {
              name = "Launch (LLDB)";
              type = "lldb";
              request = "launch";
              cwd = ''''${workspaceFolder}'';
              stopOnEntry = false;
              runInTerminal = false;
              program.__raw = ''
                		function()
                        return vim.fn.input("Path to exe: ", vim.fn.getcwd() .. '/', "file")
                 		end
              '';
              args = { };
            }
          ];
        };
      };
      dap-ui = {
        enable = true;
      };
      dap-view = {
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
            enable = false;
          };
          ols = {
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
            odin = [ "odinfmt" ];
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
            timeout_ms = 5000;
            lsp_format = "prefer";
          };
        };
      };
    };
  };
}
