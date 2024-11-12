return {
    {
        'nvim-telescope/telescope.nvim',
        keys = {
            {'<leader>ff',  '<cmd>Telescope find_files<CR>'},
            {'<leader>fg',  '<cmd>Telescope live_grep<CR>'},
            {'<leader>fb',  '<cmd>Telescope buffers<CR>'}, -- can be done natively with ":ls<cr>:b<space>"
            {'<leader>fh',  '<cmd>Telescope help_tags<CR>'},
            {'<leader>gd',  '<cmd>Telescope lsp_definitions<CR>'},
            {'<leader>gr',  '<cmd>Telescope lsp_references<CR>'},
            {'<leader>ld',  '<cmd>Telescope diagnostics<CR>'},
            {'<C-p>',       '<cmd>Telescope git_files<CR>'},
            {'<leader>gc',  '<cmd>Telescope git_commits<CR>'},
            {'<leader>gbc', '<cmd>Telescope git_bcommits<CR>'},
            {'<leader>gs',  '<cmd>Telescope git_status<CR>'},
        },
        tag = '0.1.8',
        dependencies = { {'nvim-lua/plenary.nvim'} },
        config = function()
            -- local builtin = require('telescope.builtin')
            -- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            -- vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- can be done natively with ":ls<cr>:b<space>"
            -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            --
            -- vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
            -- vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
            -- vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})
            --
            -- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            -- vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
            -- vim.keymap.set('n', '<leader>gbc', builtin.git_bcommits, {})
            -- vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

            require "telescope".setup {
                defaults = {
                    layout_strategy = 'vertical',
                    layout_config = { height = 0.99, width = 0.99 },
                },
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
            -- require('telescope').load_extension('fzf')
        end
    }
}
