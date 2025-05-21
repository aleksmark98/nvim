return {
   {
      'numToStr/Comment.nvim',
      event = { "BufReadPre", "BufNewFile" },
      opts = {},
   },
   {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {},
      config = function()
         local autopairs = require('nvim-autopairs')
         autopairs.setup()
         local Rule = require('nvim-autopairs.rule')
         autopairs.add_rules({ Rule("|", "|","zig") })
      end,
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
