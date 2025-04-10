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
   -- {'mbbill/undotree'}, -- TODO: learn undotree
}
