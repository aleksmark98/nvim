return {
    {
        "echasnovski/mini.files",
        version = false,
        event = "VeryLazy",
        config = function()
            local minifiles = require('mini.files')
            minifiles.setup()
            vim.keymap.set("n", "<leader>me", minifiles.open)
        end,
    }
}
