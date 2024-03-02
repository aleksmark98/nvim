return {
    {
        'nvim-telescope/telescope.nvim',
        -- lazy = false,
        keys = {
            {'<leader>ff'},
            {'<leader>fg'},
            {'<leader>fb'},
            {'<leader>fh'},
            {'<leader>gd'},
            {'<leader>gr'},
            {'<leader>ld'},
            {'<C-p>'},
            {'<leader>gc'},
            {'<leader>gbc'},
            {'<leader>gs'},
        },
        tag = '0.1.2',
        dependencies = { {'nvim-lua/plenary.nvim'} },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- can be done natively with ":ls<cr>:b<space>"
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

            vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
            vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
            vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})

            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
            vim.keymap.set('n', '<leader>gbc', builtin.git_bcommits, {})
            vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

            require "telescope".setup {
                pickers = {
                    git_commits = {
                        initial_mode = "normal",
                    },
                    git_bcommits = {
                        initial_mode = "normal",
                    },
                    lsp_references = {
                        initial_mode = "normal",
                    },
                    diagnostics = {
                        initial_mode = "normal",
                    },
                    git_status = {
                        initial_mode = "normal",
                    },
                }
            }
        end
    }
}
