-- Names must conform to: 
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
return {
    scheme_langserver = {
        mason = false,
        enable = true
        -- cmd = {"scheme-langserver", "~/.scheme-langserver.log", "enable", "disable"}
    },
    omnisharp = {mason = false, enable = true, filetypes = {'cs'}},
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
    erlang_ls = {
        mason = false,
        enable = true,
        cmd = {"erlang_ls"},
        filetypes = {"erlang"}
    },
    texlab = {
        mason = false,
        enable = false,
        cmd = {'texlab'},
        filetypes = {'tex', 'org'}
    },
    ols = {
        mason = false,
        enable = true,
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
        cmd = {'gopls'},
        filetypes = {'go'},
        root_markers = {'go.mod'}
    },
    -- pyright = {},
    -- rust_analyzer = {},
    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
    --
    -- Some languages (like typescript) have entire language plugins that can be useful:
    --    https://github.com/pmizio/typescript-tools.nvim
    --
    -- But for many setups, the LSP (`ts_ls`) will work just fine
    ts_ls = {
        mason = false,
        enable = false,
        cmd = "typescript-language-server",
        filetypes = {'ts', 'js'}
    },
    lua_ls = {
        mason = false,
        enable = true,
        cmd = {'lua-language-server'},
        filetypes = {'lua'},
        root_markers = {
            ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml",
            "stylua.toml", "selene.toml", "selene.yml", "lover.toml"
        },
        -- capabilities = {},
        settings = {
            Lua = {
                completion = {callSnippet = 'Replace'},
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                diagnostics = {disable = {'missing-fields'}}
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
