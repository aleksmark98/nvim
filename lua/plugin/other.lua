return {
    {
        'numToStr/Comment.nvim',
        opts = {
        },
        -- event = 'BufEnter',
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        'tpope/vim-fugitive',
        -- event = 'BufEnter',
        event = { "BufReadPre", "BufNewFile" },
    },
    -- {'mbbill/undotree'}, -- TODO: learn undotree
    {
        'theprimeagen/harpoon',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        keys = {
            "<leader>f!",
            "<leader>f@",
            "<leader>f#",
            "<leader>f$",
            "<leader>f%",
            "<leader>f^",
            "<leader>a",
            "<C-e>",
        },
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
            -- goto f[ile]1
            vim.keymap.set("n", "<leader>f!", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<leader>f@", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<leader>f#", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<leader>f$", function() ui.nav_file(4) end)
            vim.keymap.set("n", "<leader>f%", function() ui.nav_file(5) end)
            vim.keymap.set("n", "<leader>f^", function() ui.nav_file(6) end)
        end
    },
}
