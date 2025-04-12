return {
   {
      'numToStr/Comment.nvim',
      event = { "BufReadPre", "BufNewFile" },
      opts = {},
   },
   {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {}
   },
   -- {
   --     'tpope/vim-fugitive',
   --     event = 'BufEnter',
   -- },
   -- {
   --    'mbbill/undotree',
   --    keys = {
   --       {'<leader>u', '<cmd>UndotreeToggle<cr>' }
   --    }
   -- }, -- TODO: learn undotree
}
