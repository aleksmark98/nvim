return {
   {
      'numToStr/Comment.nvim',
      event = "VeryLazy",
      opts = {},
   },
   {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = function()
         local autopairs = require('nvim-autopairs')
         autopairs.setup()
         local Rule = require('nvim-autopairs.rule')
         autopairs.add_rules({ Rule("|", "|","zig") })
      end,
   },
   {
      "kylechui/nvim-surround",
      keys = {
         {"<leader>s", mode = {"v", "n"}},
         {"cs"},
         {"ds"},
      },
      opts = {
         keymaps = {
            normal = "<leader>s",
            visual = "<leader>s",
         }
      }
   },
   {
      -- mainly for G blame
      "tpope/vim-fugitive",
      event = "VeryLazy",
   }
}
