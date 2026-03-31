return {
   {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      config = function()
         require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "cpp", "r", "cuda", "lua", "vim", "vimdoc", "markdown", "latex", "python", "zig" },
            ignore_install = { "latex" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
               enable = true,

               -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
               -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
               -- Using this option may slow down your editor, and you may see some duplicate highlights.
               -- Instead of true it can also be a list of languages
               -- additional_vim_regex_highlighting = false,
               additional_vim_regex_highlighting = { "latex" },
            },
            indent = {
               enable = true,
            },
         })

         -- vim.opt.foldmethod = "expr"
         -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
         -- vim.opt.foldenable = true
         -- vim.opt.foldlevel = 99

         -- -- hack to enable folding in files opened with Telescope, see issue https://github.com/nvim-telescope/telescope.nvim/issues/699
         -- vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })
      end,
   },
   { -- sticky function definitions
      "nvim-treesitter/nvim-treesitter-context",
      event = "VeryLazy",
      dependencies = {
         "nvim-treesitter/nvim-treesitter",
      },
      opts = {
         enable = false,
      },
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
         -- The keys that will be used as a selection, in order
         -- ('asdfghjklqwertyuiopzxcvbnm' by default)
         keys = "asdfghjklqwertyuiopzxcvbnm",

         -- Grey out the rest of the text when making a selection
         -- (enabled by default)
         grey = "disable",

         -- Highlight group for the sniping value (asdf etc.)
         -- default 'Search'
         hl_snipe = "ErrorMsg",

         -- Highlight group for the visual selection of terms
         -- default 'Visual'
         hl_selection = "Visual",

         -- Highlight group for the greyed background
         -- default 'Comment'
         hl_grey = "Comment",

         -- Post-operation flashing highlight style,
         -- either 'simultaneous' or 'sequential', or false to disable
         -- default 'sequential'
         flash_style = false,

         -- Highlight group for flashing highlight afterward
         -- default 'IncSearch'
         --hl_flash = 'ModeMsg',
         hl_flash = "IncSearch",

         -- Move cursor to the other element in ISwap*With commands
         -- default false
         move_cursor = false,

         -- Automatically swap with only two arguments
         -- default nil
         autoswap = true,
      },
   },
   {
      -- keeping this for TreeSitter buffer navigation
      "stevearc/aerial.nvim",
      cmd = { "AerialNavToggle" },
      config = function()
         require("aerial").setup({
            -- backends = { "lsp", "treesitter", "markdown", "man" },
            backends = { "treesitter", "markdown", "man" },
         })

         require("telescope").load_extension("aerial")
      end,
      dependencies = {
         "nvim-treesitter/nvim-treesitter",
         "nvim-tree/nvim-web-devicons",
      },
   },
   {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = "VeryLazy",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
         require("nvim-treesitter.configs").setup({
            textobjects = {
               move = {
                  enable = true,
                  set_jumps = true, -- whether to set jumps in the jumplist
                  goto_next_start = {
                     ["]m"] = "@function.outer",
                     ["]]"] = "@class.outer",
                  },
                  goto_next_end = {
                     ["]M"] = "@function.outer",
                     ["]["] = "@class.outer",
                  },
                  goto_previous_start = {
                     ["[m"] = "@function.outer",
                     ["[["] = "@class.outer",
                  },
                  goto_previous_end = {
                     ["[M"] = "@function.outer",
                     ["[]"] = "@class.outer",
                  },
               },
               select = {
                  enable = true,
                  lookahead = true,
                  keymaps = {
                     ["af"] = "@function.outer",
                     ["if"] = "@function.inner",
                     ["ac"] = "@class.outer",
                     ["ic"] = "@class.inner",
                     ["al"] = "@loop.outer",
                     ["il"] = "@loop.inner",
                  },
               },
            },
         })
      end,
   },
   {
      -- incremental selection with Enter and BS
      "sustech-data/wildfire.nvim",
      event = "VeryLazy",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
         require("wildfire").setup()
      end,
   },
}
