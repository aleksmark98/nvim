return {
   'sindrets/diffview.nvim',
   cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewFileHistory',
   },
   init = function()
      vim.cmd("cnoreabbrev dvo DiffviewOpen")
      vim.cmd("cnoreabbrev dvc DiffviewClose")
      vim.cmd("cnoreabbrev dvh DiffviewFileHistory")
   end,
}
