vim.cmd("cnoreabbrev dvo DiffviewOpen")
vim.cmd("cnoreabbrev dvc DiffviewClose")
vim.cmd("cnoreabbrev dvh DiffviewFileHistory")

return {
   'sindrets/diffview.nvim',
   event = 'VeryLazy',
   cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewFileHistory',
   },
}
