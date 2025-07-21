return {
   "kylechui/nvim-surround",
   keys = {
      { "<leader>s", mode = { "v", "n" } },
      { "cs" },
      { "ds" },
   },
   opts = {
      keymaps = {
         normal = "<leader>s",
         visual = "<leader>s",
      },
   },
}
