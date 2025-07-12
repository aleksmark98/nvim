return {
   "mason-org/mason-lspconfig.nvim",
   opts = {
      ensure_installed = {
         "clangd",
         "cmake",
         "lua_ls",
         "rust_analyzer",
         "pyright",
         "zls",
      },
   },
   event = {"VeryLazy"}, -- not sure if this breaks anything
   dependencies = {
      {
         "mason-org/mason.nvim",
         cmd = {"Mason"},
         opts = {
            -- this doesn't work anymore :(
            -- ensure_installed = {
            --    "clangd",
            --    "clang-format",
            --    "cmake",
            --    "lua_ls",
            --    "stylua",
            --    "rustfmt",
            --    "rust-analyzer",
            --    "pyright",
            --    "yapf",
            --    "zls",
            -- },
         },
      },
      "neovim/nvim-lspconfig",
   },
}
