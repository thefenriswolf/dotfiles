return {
    {
        "jakewvincent/texmagic.nvim",
        lazy = true,
        enabled = true,
        config = function()
            require("texmagic").setup({
                -- Config goes here; leave blank for defaults
            })
        end
    }
}
