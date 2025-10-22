--[[
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ async = false, lsp_format = "fallback", bufnr = args.buf })
  end,
})
]]
--
