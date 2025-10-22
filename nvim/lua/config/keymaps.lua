-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- switch to other open window
-- CTRL-w w
-- or
-- CTRL-w CTRL-w

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- vs - Makes vertical split
vim.keymap.set("n", "vs", "<C-W>v", { desc = "Vertical Split" })
-- ss - Makes horizontal split
vim.keymap.set("n", "hs", "<C-W>s", { desc = "Horizontal Split" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", function()
  vim.diagnostic.setloclist()
end, { desc = "Open diagnostic [Q]uickfix list" })

-- LSP remaps
vim.keymap.set("n", "grh", function()
  vim.lsp.buf.hover({
    border = "single",
    --max_height = 25,
    --max_width = 120,
  })
end, { desc = "Display info in floating window" })
