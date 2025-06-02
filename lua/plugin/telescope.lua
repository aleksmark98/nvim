return {
   {
      'nvim-telescope/telescope.nvim',
      keys = {
         {'<leader>ff',  '<cmd>Telescope find_files<CR>'}, -- uses FZF via an extention
         {'<leader>rg',  '<cmd>Telescope live_grep<CR>'}, -- native - uses ripgrep without args;
         {'<leader>nvc',  "<cmd>lua require'telescope.builtin'.live_grep({ cwd='~/.config/nvim/' })<CR>"}, -- native - uses ripgrep without args
         {'<leader>fb',  '<cmd>Telescope buffers<CR>'}, -- can be done natively with ":ls<cr>:b<space>"
         {'<leader>fh',  '<cmd>Telescope help_tags<CR>'},
         {'<leader>gd',  '<cmd>Telescope lsp_definitions<CR>'},
         {'<leader>gr',  '<cmd>Telescope lsp_references<CR>'},
         {'<leader>ld',  '<cmd>Telescope diagnostics<CR>'},
         {'<leader>gf',  '<cmd>Telescope git_files<CR>'},
         {'<leader>gc',  '<cmd>Telescope git_commits<CR>'},
         {'<leader>gbc', '<cmd>Telescope git_bcommits<CR>'},
         {'<leader>gs',  '<cmd>Telescope git_status<CR>'},
      },
      cmd = {'Telescope'},
      tag = '0.1.8',
      dependencies = {
         {'nvim-lua/plenary.nvim'},
         {'nvim-telescope/telescope-fzf-native.nvim', build='make'},
         {'desdic/telescope-rooter.nvim'},
      },
      config = function()
         local telescope = require("telescope")
         telescope.setup {
            defaults = {
               layout_strategy = 'vertical',
               layout_config = { height = 0.99, width = 0.99 },
            },
            pickers = {
               git_commits = {
                  initial_mode = "normal",
               },
               git_bcommits = {
                  initial_mode = "normal",
               },
               lsp_references = {
                  initial_mode = "normal",
               },
               diagnostics = {
                  initial_mode = "normal",
               },
               git_status = {
                  initial_mode = "normal",
               },
            },
            extensions = {
               fzf = {},
               rooter = {
                  enable = true,
                  patterns = {'.git'}
               }
            },
         }
         telescope.load_extension('fzf')
         telescope.load_extension('rooter')
      end
   }
}
