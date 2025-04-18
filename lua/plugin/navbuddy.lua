return {
   'SmiteshP/nvim-navbuddy',
   dependencies = {
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim',
      'williamboman/mason-lspconfig.nvim',
   },
   keys = {
      { '<leader>nb', '<cmd>Navbuddy<CR>' },
   },
   cmd = {'Navbuddy'},
   opts = { lsp = { auto_attach = true } },
}
