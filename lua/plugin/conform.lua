return {
   "stevearc/conform.nvim",
   event = { "VeryLazy" },
   cmd = { "ConformInfo" },
   keys = {
      {
         "<leader>fm",
         function()
            require("conform").format({ async = true })
         end,
         mode = "",
         desc = "Format buffer",
      },
   },
   -- This will provide type hinting with LuaLS
   ---@module "conform"
   ---@type conform.setupOpts
   opts = {
      -- Define your formatters
      formatters_by_ft = {
         lua = { "stylua" },
         python = { "ruff_fix", "ruff_format", lsp_format = "fallback" },
         zig = { "zigfmt" },
         rust = { "rustfmt", lsp_format = "fallback" },
         cpp = { "clang_format" },
         javascript = { "prettierd", "prettier", stop_after_first = true },
         typescript = { "prettierd", "prettier", stop_after_first = true },
         html = { "prettierd", "prettier", stop_after_first = true },
      },
      -- Set default options
      default_format_opts = {
         lsp_format = "fallback",
      },
      -- Set up format-on-save
      -- format_on_save = { timeout_ms = 500 },
      -- Customize formatters
      formatters = {
         clang_format = {
            prepend_args = {
               "--style={BasedOnStyle: llvm, IndentWidth: 3}",

               -- "--fallback-style={BasedOnStyle: llvm, IndentWidth: 3}",
            },
         },
         shfmt = { prepend_args = { "-i", "3" } },
         stylua = {
            append_args = {
               "--indent-type",
               "Spaces",
               "--indent-width",
               "3",
            },
         },
      },
      ["*"] = { "trim_whitespace" },
   },
   init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
   end,
}
