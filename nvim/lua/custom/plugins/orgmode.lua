return {
    { -- https://github.com/nvim-orgmode/orgmode
        "nvim-orgmode/orgmode",
        lazy = true,
        enabled = true,
        event = "VeryLazy",
        ft = {"org"},
        config = function()
            -- Setup orgmode
            require("orgmode").setup({
                org_agenda_files = "~/org/",
                org_default_notes_file = "~/org/refile.org"
            })
            -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
            -- add ~org~ to ignore_install
            -- require('nvim-treesitter.configs').setup({
            --   ensure_installed = 'all',
            --   ignore_install = { 'org' },
            -- })
        end
    }, {
        "nvim-neorg/neorg",
        enabled = false,
        lazy = true, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = true
    }
}
