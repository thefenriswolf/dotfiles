return {
    {
        "epwalsh/obsidian.nvim",
        enabled = true,
        lazy = true,
        version = "*",
        ft = {"markdown"},
        config = true,
        dependencies = {"nvim-lua/plenary.nvim"},
        opts = {
            workspaces = {
                {name = "Main", path = "~/org/notes/Main"},
                {name = "daily", path = "~/org/notes/daily"}
            },
            ui = {enable = false}
        }
    }

}
