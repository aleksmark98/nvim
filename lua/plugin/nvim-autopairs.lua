return {
   "windwp/nvim-autopairs",
   event = "InsertEnter",
   config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup()
      local Rule = require("nvim-autopairs.rule")
      autopairs.add_rules({ Rule("|", "|", "zig") })
   end,
}
