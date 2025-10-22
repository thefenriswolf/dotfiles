return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  lazy = false,
  dependencies = {
    -- completion engine
    { "saghen/blink.cmp" },
    -- LSP status updates
    { "j-hui/fidget.nvim", opts = {} },
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        inlay_hints = { enabled = true },
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
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
    -- Java
    vim.lsp.config("jdtls", {
      root_markers = { "build.gradle", "build.gradle.kts", "gradlew.bat", "pom.xml", ".git" },
      filetypes = { "java" },
      --cmd = { "jdtls" },
    })
    vim.lsp.enable("java_language_server", true)
  end,
}
