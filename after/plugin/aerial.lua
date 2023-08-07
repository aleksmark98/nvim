local on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '[[', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', ']]', '<cmd>AerialNext<CR>', {buffer = bufnr})
end

vim.keymap.set('n', '<F9>', '<cmd>AerialToggle! left<CR>')

require('telescope').load_extension('aerial')
