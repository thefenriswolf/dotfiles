return {
    {
        'epwalsh/obsidian.nvim',
        enabled = true,
        lazy = true,
        version = '*',
        ft = {'markdown'},
        config = true,
        dependencies = {'nvim-lua/plenary.nvim'},
        opts = {
            workspaces = {
                {name = 'notes', path = '~/notes'}
                -- {name = "daily", path = "~/org/notes/daily"}
            },
            ui = {enable = false}
        }
    }
}
