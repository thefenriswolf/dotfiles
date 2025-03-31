-- Names must conform to: 
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
return {
    ltex = {
        mason = false,
        enable = true,
        cmd = {'ltex-ls', '--no-endless'},
        filetypes = {'markdown', 'org', 'tex', 'gitcommit'},
        settings = {
            ltex = {
                disabledRules = {
                    ['en-GB'] = {'PROFANITY'},
                    ['de-AT'] = {'PROFANITY'}
                },
                language = {'de-AT', 'en-GB'}
            }
        }
    },
    texlab = {
        mason = false,
        enable = false,
        cmd = {'texlab'},
        filetypes = {'tex', 'org'}
    },
    ols = {
        mason = false,
        enable = false,
        cmd = {'ols'},
        fileypes = {'odin'}
        -- settings = {checker_args = "-strict-style"}
    },
    kotlin_language_server = {
        mason = false,
        enable = false,
        cmd = {'kotlin-language-server'},
        fileypes = {'kotlin'}
    },

    -- clangd = {},
    gopls = {
        mason = false,
        enable = true,
        -- cmd={'gopls'},
        filetypes = {'go'}
    },
    -- pyright = {},
    -- rust_analyzer = {},
    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
    --
    -- Some languages (like typescript) have entire language plugins that can be useful:
    --    https://github.com/pmizio/typescript-tools.nvim
    --
    -- But for many setups, the LSP (`ts_ls`) will work just fine
    ts_ls = {mason = false, enable = true, filetypes = {'ts', 'js'}},
    omnisharp = {
        mason = false,
        enable = false,
        cmd = {'OmniSharp', '-lsp'},
        filetypes = {'cs', 'fs'}
    },
    lua_ls = {
        mason = false,
        enable = true,
        cmd = {'lua-lsp'},
        filetypes = {'lua'},
        -- capabilities = {},
        settings = {
            Lua = {
                completion = {callSnippet = 'Replace'}
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
            }
        }
    },
    clojure_lsp = {
        mason = false,
        enable = false,
        cmd = {'clojure-lsp'},
        filetypes = {'clojure'}
    }
}
