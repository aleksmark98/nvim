return {
    {
        'lervag/vimtex',
        vimtex_compiler_engine = 'lualatex',
        lazy = false,
        config = function()
            vim.keymap.set('n', '<Leader>ll', '<cmd>! lualatex .\\diplomka.tex<cr>')
        end
    }
}
