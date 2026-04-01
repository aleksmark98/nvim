return {
   {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      build = ":TSUpdate",
      branch = "main",
      config = function()
         local ts = require("nvim-treesitter")

         local languages = {
            "lua",
            "rust",
            "python",
            "typescript",
            "tsx",
            "javascript",
            "css",
            "regex",
            "markdown",
            "vim",
            "vimdoc",
            "c",
            "cpp",
            "query",
            "cuda",
         }
         ts.install(languages)

         local ts_settings = vim.api.nvim_create_augroup("TSSettings", { clear = true })
         vim.api.nvim_create_autocmd("FileType", {
            desc = "Set up nvim-treesitter highlighting and indentation",
            group = ts_settings,
            pattern = languages,
            callback = function()
               -- -- Syntax highlighting, provided by Neovim
               vim.treesitter.start()
               -- Indentation, provided by nvim-treesitter
               vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
               -- Folds using treesitter expr, provided by Neovim
               vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
               vim.wo[0][0].foldmethod = "expr"
            end,
         })
         -- Start every file with folds open
         vim.opt.foldlevel = 99
         vim.opt.foldlevelstart = 99
      end,
   },
   {
      "mizlan/iswap.nvim",
      keys = {
         { "<leader>is", "<cmd>ISwapWith<CR>" },
         { "<leader>in", "<cmd>ISwapNodeWith<CR>" },
         { "<leader>ma", "<cmd>IMoveWith<CR>" },
         { "<leader>mn", "<cmd>IMoveNodeWith<CR>" },
      },
      opts = {
         -- Grey out the rest of the text when making a selection
         -- (enabled by default)
         grey = "disable",

         -- Highlight group for the sniping value (asdf etc.)
         -- default 'Search'
         hl_snipe = "ErrorMsg",

         -- Post-operation flashing highlight style,
         -- either 'simultaneous' or 'sequential', or false to disable
         -- default 'sequential'
         flash_style = false,

         -- Highlight group for flashing highlight afterward
         -- default 'IncSearch'
         --hl_flash = 'ModeMsg',
         -- hl_flash = "IncSearch",

         -- Automatically swap with only two arguments
         -- default nil
         autoswap = true,
      },
   },
   {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      event = "VeryLazy",
      init = function()
         -- Disable entire built-in ftplugin mappings to avoid conflicts.
         -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
         vim.g.no_plugin_maps = true

         -- Or, disable per filetype (add as you like)
         -- vim.g.no_python_maps = true
         -- vim.g.no_ruby_maps = true
         -- vim.g.no_rust_maps = true
         -- vim.g.no_go_maps = true
      end,
      config = function()
         -- configuration
         require("nvim-treesitter-textobjects").setup({
            select = {
               -- Automatically jump forward to textobj, similar to targets.vim
               lookahead = true,
               -- You can choose the select mode (default is charwise 'v')
               --
               -- Can also be a function which gets passed a table with the keys
               -- * query_string: eg '@function.inner'
               -- * method: eg 'v' or 'o'
               -- and should return the mode ('v', 'V', or '<c-v>') or a table
               -- mapping query_strings to modes.
               selection_modes = {
                  ["@parameter.outer"] = "v", -- charwise
                  ["@function.outer"] = "V", -- linewise
                  ["@class.outer"] = "<c-v>", -- blockwise
               },
               -- If you set this to `true` (default is `false`) then any textobject is
               -- extended to include preceding or succeeding whitespace. Succeeding
               -- whitespace has priority in order to act similarly to eg the built-in
               -- `ap`.
               --
               -- Can also be a function which gets passed a table with the keys
               -- * query_string: eg '@function.inner'
               -- * selection_mode: eg 'v'
               -- and should return true of false
               include_surrounding_whitespace = false,
            },
         })

         -- keymaps
         -- You can use the capture groups defined in `textobjects.scm`
         vim.keymap.set({ "x", "o" }, "af", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
         end)
         vim.keymap.set({ "x", "o" }, "if", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
         end)
         vim.keymap.set({ "x", "o" }, "al", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
         end)
         vim.keymap.set({ "x", "o" }, "il", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
         end)
         vim.keymap.set({ "x", "o" }, "ac", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
         end)
         vim.keymap.set({ "x", "o" }, "ic", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
         end)
         -- You can also use captures from other query groups like `locals.scm`
         vim.keymap.set({ "x", "o" }, "as", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
         end)
      end,
   },
}
