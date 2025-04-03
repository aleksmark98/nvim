return {
    {
        'numToStr/Comment.nvim',
        opts = {
        },
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        'tpope/vim-fugitive',
        event = 'BufEnter',
    },
    -- {'mbbill/undotree'}, -- TODO: learn undotree
}
