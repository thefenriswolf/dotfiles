return {
    { -- https://github.com/nvim-orgmode/orgmode
        "nvim-orgmode/orgmode",
        enabled = false,
        lazy = true,
        -- event = "VeryLazy",
        ft = {"org"},
        config = function()
            -- Setup orgmode
            require("orgmode").setup({
                org_agenda_files = "~/org/*.org",
                org_default_notes_file = "~/org/refile.org"
            })
            -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
            -- add ~org~ to ignore_install
            -- require('nvim-treesitter.configs').setup({
            --   ensure_installed = 'all',
            --   ignore_install = { 'org' },
            -- })
        end,
        dependencies = {
            -- "chipsenkbeil/org-roam.nvim", 
            "lukas-reineke/headlines.nvim"
        }
    }, {
        "lukas-reineke/headlines.nvim",
        enabled = false,
        lazy = true,
        dependencies = {
            "nvim-orgmode/orgmode", "nvim-treesitter/nvim-treesitter"
        },
        config = true
    }, {
        "chipsenkbeil/org-roam.nvim",
        enabled = false,
        lazy = true,
        dependencies = {"nvim-orgmode/orgmode"},
        config = function()
            require("org-roam").setup({
                directory = "~/org/notes"
                -- optional
                -- org_files = {"~/another_org_dir", "~/some/folder/*.org","~/a/single/org_file.org"}
            })
        end
    }, {
        "nvim-neorg/neorg",
        enabled = true,
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.syntax"] = {},
                    ["core.tangle"] = {}
                }
            })
        end
    }
}
