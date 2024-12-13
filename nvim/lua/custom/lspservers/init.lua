return {
  ltex = {
    cmd = { '/etc/profiles/per-user/ro/bin/ltex-ls', '--no-endless' },
    filetypes = { 'markdown', 'org', 'tex', 'gitcommit' },
    settings = {
      ltex = {
        disabledRules = {
          ['en-GB'] = { 'PROFANITY' },
          ['de-AT'] = { 'PROFANITY' },
        },
        language = { 'de-AT', 'en-GB' },
      },
    },
  },
  texlab = {
    cmd = { '/etc/profiles/per-user/ro/bin/texlab' },
    filetypes = { 'tex' },
  },
  ols = {
    cmd = { '/run/current-system/sw/bin/ols' },
    fileypes = { 'odin' },
    -- settings = {checker_args = "-strict-style"}
  },
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  --
  -- Some languages (like typescript) have entire language plugins that can be useful:
  --    https://github.com/pmizio/typescript-tools.nvim
  --
  -- But for many setups, the LSP (`ts_ls`) will work just fine
  -- ts_ls = {},
  omnisharp = {
    cmd = { '/etc/profiles/per-user/ro/bin/OmniSharp', '-lsp' },
    filetypes = { 'cs', 'fs' },
  },
  lua_ls = {
    cmd = { '/etc/profiles/per-user/ro/bin/lua-lsp' },
    filetypes = { 'lua' },
    -- capabilities = {},
    settings = {
      Lua = {
        completion = { callSnippet = 'Replace' },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  clojure_lsp = {
    cmd = { '/etc/profiles/per-user/ro/bin/clojure-lsp' },
    filetypes = { 'clojure' },
  },
}
