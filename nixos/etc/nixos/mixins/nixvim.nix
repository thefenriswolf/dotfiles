# inputs,
{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    #tree-sitter
    stylua
    luaformatter
    lua
    luajit
    lua52Packages.lua-lsp
    lua52Packages.luacheck
    lua-language-server
    neovim
  ];

  # nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
  programs.neovim = {
    enable = true;
    # package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    configure = {
      customRC = ''
                               packadd! catppuccin-nvim


        lua << END


                               -- colorscheme
                               vim.cmd.colorscheme[[catppuccin-frappe]]
                               -- leader key
                               vim.g.mapleader = " "
                               vim.g.maplocalleader = " "
                               -- Set highlight on search
                               vim.o.hlsearch = true

                               -- confirm
                               vim.o.confirm = true

                               -- use nerd font icons
                               vim.g.have_nerd_font = true

                               -- Make line numbers default
                               vim.wo.number = true
                               vim.wo.relativenumber = true

                               -- Enable mouse mode
                               vim.o.mouse = "a"

                               -- Sync clipboard between OS and Neovim.
                               -- vim.o.clipboard = "unnamedplus"

                               -- Enable break indent
                               vim.o.breakindent = true

                               -- No swap files
                               vim.opt.swapfile = false
                               vim.opt.backup = false
                               vim.opt.writebackup = false

                               -- Save undo history
                               vim.o.undofile = true

                               -- Case-insensitive searching UNLESS \C or capital in search
                               vim.o.ignorecase = true
                               vim.o.smartcase = true

                               -- live substitutions
                               vim.o.inccommand = "split"

                               -- highlight cursor line
                               vim.o.cursorline = true

                               -- listchars
                               vim.o.list = true
                               vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

                               -- Keep signcolumn on by default
                               vim.wo.signcolumn = "yes"

                               -- Decrease update time
                               vim.o.updatetime = 250
                               vim.o.timeoutlen = 300

                               -- Set completeopt to have a better completion experience
                               vim.o.completeopt = "menuone,noselect"

                               -- Don't show modes (insert/visual) as it is already in the statusline
                               vim.opt.showmode = false

                               -- " Open splits on the right and below
                               vim.opt.splitbelow = true
                               vim.opt.splitright = true

                               -- " update vim after file update from outside
                               vim.opt.autoread = true

                               -- " Indentation
                               vim.opt.autoindent = true
                               vim.opt.smartindent = true
                               vim.opt.smarttab = true
                               vim.opt.tabstop = 2
                               vim.opt.softtabstop = 2
                               vim.opt.shiftwidth = 2

                               -- enable diagnostics
                               vim.diagnostic.enable = true
                               vim.diagnostic.config({
                                   virtual_lines = true,
                                   })

                               -- " Always use spaces insted of tabs
                               vim.opt.expandtab = true

                               -- " Don't wrap lines
                               vim.opt.wrap = true
                               -- " Wrap lines at convenient points
                               vim.opt.linebreak = true
                               -- " Show line breaks
                               vim.opt.showbreak = "↳"

                               -- " Start scrolling when we'are 8 lines aways from borders
                               vim.opt.scrolloff = 10
                               vim.opt.sidescrolloff = 15
                               vim.opt.sidescroll = 5

                               -- " This makes vim act like all other editors, buffers can
                               -- " exist in the background without being in a window.
                               vim.opt.hidden = true

                               -- " Add the g flag to search/replace by default
                               vim.opt.gdefault = true

                               -- Lazy redraw
                               vim.o.lazyredraw = true

                               -- " keymappings
                               vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
                               vim.keymap.set("n", "vs", "<C-W>v", { desc = "Vertical Split" })
                               vim.keymap.set("n", "hs", "<C-W>s", { desc = "Horizontal Split" })

                               vim.keymap.set("n", "<leader>q", function()
                               vim.diagnostic.setloclist()
                                   end, { desc = "Open diagnostic [Q]uickfix list" })

                               vim.keymap.set("n", "grh", function()
                               vim.lsp.buf.hover({
                                   border = "single",
                                   })
                                  end, { desc = "Display info in floating window" })
                               vim.keymap.set("n", "<leader>g", ":Neogit<CR>", { desc = "Git status" })

                              -- " PLUGIN CONFIG
                              -- " Telescope
                              require("telescope").setup({
                              extensions = {
                                    ["ui-select"] = {
                                     require("telescope.themes").get_dropdown(),
                                       },
                                     },
                                     })
                              builtin = require("telescope.builtin")
                              vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
                              vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
                              vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
                              vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
                              vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
                              vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
                              vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
                              vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
                              vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
                              vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

                              -- " Mini
                              -- Better Around/Inside textobjects
                              -- Examples:
                              --  - va)  - [V]isually select [A]round [)]paren
                              --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
                              --  - ci'  - [C]hange [I]nside [']quote
                              require("mini.ai").setup({ n_lines = 500 })

                              -- Add/delete/replace surroundings (brackets, quotes, etc.)
                              -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
                              -- - sd'   - [S]urround [D]elete [']quotes
                              -- - sr)'  - [S]urround [R]eplace [)] [']
                              require("mini.surround").setup()

                              -- Simple and easy statusline.
                              --  You could remove this setup call if you don't like it,
                              --  and try some other statusline plugin
                              local statusline = require("mini.statusline")
                              -- set use_icons to true if you have a Nerd Font
                              statusline.setup({ use_icons = vim.g.have_nerd_font })

                              -- quickly comment line or region
                              -- - gcc  -  comment line
                              require("mini.comment").setup()

                              -- autopairs
                              require("mini.pairs").setup()

                              -- floating notification box
                              require("mini.notify").setup()

                               -- " Conform
                               require("conform").setup({
                               format_on_save = { timeout_ms = 1000, lsp_format = "prefer" },
                               formatters_by_ft = {
                                 lua = { "stylua", "lua-format", stop_after_first = true },
                                 nix = { "nixfmt" },
                                 -- fsharp = { "fantomas", lsp_format = "first" },
                                 cs = { "csharpier", stop_after_first = true },
                                 go = { "goimports", "gofmt", stop_after_first = true },
                                 python = { "isort", "black", stop_after_first = true },
                                 rust = { "rustfmt", lsp_format = "fallback" },
                                 javascript = { "prettierd", "prettier", stop_after_first = true },
                                 html = { "tidy -m" }
                                  }
                                  })
                -- " LSPCONFIG
                   -- Nix
                   vim.lsp.config("nixd", {
                     settings = {
                       nixd = {
                         formatting = {
                           command = { "nixfmt" },
                         },
                       },
                     },
                   })
                   vim.lsp.enable("nixd", true)

                   -- GO
                   vim.lsp.config("gopls", {
                     root_markers = { "go.mod", ".git" },
                     cmd = { "gopls" },
                   })
                   vim.lsp.enable("gopls", true)

                   -- C#
                   vim.lsp.config("omnisharp", {
                     root_markers = { "*.csproj" },
                     --  cmd = { "OmniSharp -lsp" },
                   })
                   vim.lsp.enable("omnisharp", true)

                   -- F#
                   vim.lsp.enable("fsautocomplete", false)

                   -- Java
                   vim.lsp.config("jdtls", {
                     root_markers = { "build.gradle", "build.gradle.kts", "gradlew.bat", "pom.xml", ".git" },
                     filetypes = { "java" },
                     --cmd = { "jdtls" },
                   })
                   vim.lsp.enable("java_language_server", true)



        END
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          nvim-lspconfig
          neogit
          which-key-nvim
          trouble-nvim
          blink-cmp
          conform-nvim
          mini-nvim
          telescope-nvim
          vim-visual-multi
          gitsigns-nvim
          nvim-treesitter.withAllGrammars
          #Ionide-vim
        ];
        opt = [
          conjure
          catppuccin-nvim
        ];
      };
    };
  };

}
