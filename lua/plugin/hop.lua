return{
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        -- event = "BufEnter",
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            local hop = require('hop')
            vim.keymap.set('', 's', function()
                hop.hint_words({})
            end, {remap=true})
            -- vim.keymap.set('', '<leader>l', function()
            --   hop.hint_lines({})
            -- end, {remap=true})
            -- vim.keymap.set('', '<leader>;', function()
            --   hop.hint_anywhere({})
            -- end, {remap=true})
        end
    }
}
