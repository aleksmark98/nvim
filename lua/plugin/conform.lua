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
         python = { "yapf" },
         zig = { "zigfmt" },
         rust = { "rustfmt", lsp_format = "fallback" },
         cpp = { "clang_format" },
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
               '--style=file',
               '--fallback-style={BasedOnStyle: llvm, IndentWidth: 3}'
            },
         },
         shfmt = {
            prepend_args = { "-i", "3" },
         },
         stylua = {
            prepend_args = {
               '--indent-type Spaces'
            }
         }
      },
		["*"] = { "trim_whitespace" },
   },
   init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
   end,
}
