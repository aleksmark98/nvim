return {
   "sindrets/diffview.nvim",
   cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
   },
   init = function()
      vim.cmd("cnoreabbrev dvo DiffviewOpen")
      vim.cmd("cnoreabbrev dvc DiffviewClose")
      -- dvl for diffview log - like a git log with diffview diffs
      vim.cmd("cnoreabbrev dvl DiffviewFileHistory")
   end,
   config = function()
      vim.opt.diffopt:append { 'algorithm:patience' }
      local actions = require("diffview.actions")
      require("diffview").setup({
         enhanced_diff_hl = true,
         default_args = {    -- Default args prepended to the arg-list for the listed commands
            DiffviewOpen = { "--imply-local" },
         },
         keymaps = {
            -- stylua: ignore
            view = {
               { "n", "<c-n>",          actions.select_next_entry,              { desc = "Open the diff for the next file" } },
               { "n", "<c-p>",          actions.select_prev_entry,              { desc = "Open the diff for the previous file" } },
            },
            -- stylua: ignore
            file_panel = {
               { "n", "<c-u>",          actions.scroll_view(-0.25),             { desc = "Scroll the view up" } },
               { "n", "<c-d>",          actions.scroll_view(0.25),              { desc = "Scroll the view down" } },
               { "n", "<c-n>",          actions.select_next_entry,              { desc = "Open the diff for the next file" } },
               { "n", "<c-p>",          actions.select_prev_entry,              { desc = "Open the diff for the previous file" } },
            },
            -- stylua: ignore
            file_history_panel = {
               { "n", "<c-u>",         actions.scroll_view(-0.25),          { desc = "Scroll the view up" } },
               { "n", "<c-d>",         actions.scroll_view(0.25),           { desc = "Scroll the view down" } },
               { "n", "<c-n>",         actions.select_next_entry,           { desc = "Open the diff for the next file" } },
               { "n", "<c-p>",         actions.select_prev_entry,           { desc = "Open the diff for the previous file" } },
            },
         },
      })
   end,
}
