return {
    {                                      -- Optional
        lazy = false,
        -- event = {"BufReadPre", "BufNewFile"},
        'williamboman/mason.nvim',
        -- run = function()
        --     pcall(vim.cmd, 'MasonUpdate')
        -- end,
    },
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'hrsh7th/cmp-cmdline'},
    {'L3MON4D3/LuaSnip'},     -- Required
    {
        "ray-x/lsp_signature.nvim",
        event = {"BufReadPre", "BufNewFile"},
    },
}
