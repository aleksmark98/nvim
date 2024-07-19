return{
    {
        'phaazon/hop.nvim',
        -- 'smoka7/hop.nvim',
        -- version = "*",
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            local hop = require('hop')
            vim.keymap.set('', 's', function()
                hop.hint_words({})
            end, {remap=true})
            vim.keymap.set('', 'S', function()
                hop.hint_char1({})
            end, {remap=true})

            local jump_target = require("hop.jump_target")
            local set = vim.keymap.set
            local hint_char1_and_then = function(and_then_func)
                return function()
                    local opts = hop.opts
                    local c = hop.get_input_pattern("Hop 1 char: ", 1)
                    local generator = jump_target.jump_targets_by_scanning_lines
                    hop.hint_with_callback(generator(jump_target.regex_by_case_searching(c, true, opts)), opts, function(jt)
                        hop.move_cursor_to(jt.window, jt.line + 1, jt.column - 1, opts.hint_offset)
                        and_then_func()
                    end)
                end
            end
            local hint_word_and_then = function(and_then_func)
                return function()
                    local opts = hop.opts
                    local generator = jump_target.jump_targets_by_scanning_lines
                    hop.hint_with_callback(generator(jump_target.regex_by_word_start()), opts, function(jt)
                        hop.move_cursor_to(jt.window, jt.line + 1, jt.column - 1, opts.hint_offset)
                        and_then_func()
                        vim.api.nvim_feedkeys("``", "n", true)
                    end)
                end
            end
            local default_text_objects = {
                'w', 'W', 's', 'p', '[', ']', '(', ')', 'b',
                '>', '<', 't', '{', '}', 'B', '"', '\'', '`'
            }

            for _,v in ipairs(default_text_objects) do
                set("n", "dir" .. v, hint_word_and_then(function()
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('di'..v, true, false, true), "n", true)
                end), { noremap = true })

                set("n", "dar" .. v, hint_char1_and_then(function()
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('da'..v, true, false, true), "n", true)
                end), { noremap = true })

                set("n", "yir" .. v, hint_word_and_then(function()
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('yi'..v, true, false, true), "n", true)
                end), { noremap = true })

                set("n", "yar" .. v, hint_word_and_then(function()
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('ya'..v, true, false, true), "n", true)
                end), { noremap = true })
            end
        end,
    }
}
