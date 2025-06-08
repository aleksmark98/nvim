return {
   {
      'nvim-telescope/telescope.nvim',
      keys = {
         {'<leader>ff',  '<cmd>Telescope find_files<CR>'}, -- uses FZF via an extention
         {'<leader>gr',  '<cmd>lua FZF_THEN_GREP()<CR>'}, -- native - uses ripgrep without args;
         {'<leader>rg',  '<cmd>Telescope live_grep<CR>'}, -- native - uses ripgrep without args;
         {'<leader>rh',  "<cmd>lua require'telescope.builtin'.live_grep({ layout_strategy='horizontal' })<CR>"},
         {'<leader>nvc',  "<cmd>lua require'telescope.builtin'.live_grep({ cwd='~/.config/nvim/' })<CR>"},
         {'<leader>fb',  '<cmd>Telescope buffers<CR>'}, -- can be done natively with ":ls<cr>:b<space>"
         {'<leader>fh',  '<cmd>Telescope help_tags<CR>'},
         {'<leader>ld',  '<cmd>Telescope lsp_definitions<CR>'},
         {'<leader>lr',  '<cmd>Telescope lsp_references<CR>'},
         {'<leader>fd',  '<cmd>Telescope diagnostics<CR>'},
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
      end,
      init = function()
         FZF_THEN_GREP = function()
            local builtin = require("telescope.builtin")

            builtin.find_files({
               attach_mappings = function(prompt_bufnr)
                  local actions = require("telescope.actions")
                  local action_state = require("telescope.actions.state")
                  actions.select_default:replace(function()
                     local current_picker = action_state.get_current_picker(prompt_bufnr)
                     local selections = current_picker:get_multi_selection()
                     -- if no multi-selection, leverage current selection
                     if vim.tbl_isempty(selections) then
                        table.insert(selections, action_state.get_selected_entry())
                     end
                     local paths = vim.tbl_map(function(e)
                        return e.path
                     end, selections)
                     actions.close(prompt_bufnr)
                     builtin.live_grep({
                        search_dirs = paths,
                     })
                  end)
                  -- true: attach default mappings; false: don't attach default mappings
                  return true
               end,
            })
         end
      end,
   }
}
