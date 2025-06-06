return {
   {
      'numToStr/Comment.nvim',
      event = "VeryLazy",
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
}
