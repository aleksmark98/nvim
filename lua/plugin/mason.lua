return {
   "mason-org/mason-lspconfig.nvim",
   opts = {},
   event = {"BufReadPre", "BufNewFile"},
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
               "black",
               "zls",
            },
         }
      },
      "neovim/nvim-lspconfig",
   },
}
