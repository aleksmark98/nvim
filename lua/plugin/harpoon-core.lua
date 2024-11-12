return {
    'MeanderingProgrammer/harpoon-core.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    event = 'BufEnter',
    config = function()
        require('harpoon-core').setup({
            -- Make existing window active rather than creating a new window
            use_existing = true,
            -- Default action when opening a mark, defaults to current window
            -- Example: 'vs' will open in new vertical split, 'tabnew' will open in new tab
            default_action = nil,
            -- Set marks specific to each git branch inside git repository
            mark_branch = false,
            -- Use the previous cursor position of marked files when opened
            use_cursor = true,
            -- Settings for popup window
            menu = { width = 60, height = 10 },
            -- Controls confirmation when deleting mark in telescope
            delete_confirmation = true,
        })
        require('telescope').load_extension('harpoon-core')

        ---@param lhs string
        ---@param rhs string|function
        ---@param desc string
        local function map(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, { desc = desc })
        end
        local mark = require('harpoon-core.mark')
        local ui = require('harpoon-core.ui')

        vim.keymap.set('n', '<leader>!', function() ui.nav_file(1) end, { desc = 'Harpoon open file 1' })
        vim.keymap.set('n', '<leader>@', function() ui.nav_file(2) end, { desc = 'Harpoon open file 2' })
        vim.keymap.set('n', '<leader>#', function() ui.nav_file(3) end, { desc = 'Harpoon open file 3' })
        vim.keymap.set('n', '<leader>$', function() ui.nav_file(4) end, { desc = 'Harpoon open file 4' })
        vim.keymap.set('n', '<leader>%', function() ui.nav_file(5) end, { desc = 'Harpoon open file 5' })
        -- no clue why this doesnt work
        -- map('<leader>!', ui.nav_file(1), 'Harpoon open file 1')
        -- map('<leader>@', ui.nav_file(2), 'Harpoon open file 2')
        -- map('<leader>#', ui.nav_file(3), 'Harpoon open file 3')
        -- map('<leader>$', ui.nav_file(4), 'Harpoon open file 4')
        -- map('<leader>%', ui.nav_file(5), 'Harpoon open file 5')

        map('<leader>ha', mark.add_file, 'Add current file')
        map('<leader>hr', mark.rm_file, 'Remove current file')
        map('<leader>hu', ui.toggle_quick_menu, 'Toggle UI')
        map('<leader>hn', ui.nav_next, 'Next file')
        map('<leader>hp', ui.nav_prev, 'Previous file')
        map('<leader>ht', '<cmd>Telescope harpoon-core marks<cr>', 'Telescope menu')
    end,
}

