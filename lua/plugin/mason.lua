return {
   "mason-org/mason-lspconfig.nvim",
   opts = {},
   event = {"VeryLazy"}, -- not sure if this breaks anything
   dependencies = {
      {
         "mason-org/mason.nvim",
         cmd = {"Mason"},
         opts = {
            ensure_installed = {
               "clangd",
               "cmake",
               "lua_ls",
               "stylua",
               "pyright",
               "yapf",
               "zls",
            },
         }
      },
      "neovim/nvim-lspconfig",
   },
}
