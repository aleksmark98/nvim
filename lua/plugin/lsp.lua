return {
   {
      'ray-x/lsp_signature.nvim',
      event = {'InsertEnter'},
      -- keys = {
      --    {'<C-k>' ''}
      -- },
      opts = {
         bind = true,
         handler_opts = {
            border = 'rounded'
         },
      },
      config = function()
         vim.keymap.set({ 'n' }, '<C-k>', function()       require('lsp_signature').toggle_float_win()
         end, { silent = true, noremap = true, desc = 'toggle signature' })

         vim.keymap.set({ 'n' }, '<Leader>k', function()
            vim.lsp.buf.signature_help()
         end, { silent = true, noremap = true, desc = 'toggle signature' })
      end
   },
   {
      'williamboman/mason.nvim',
      cmd = {"Mason"},
      opts = {},
   },
   {
      'williamboman/mason-lspconfig.nvim',
      event = {"BufReadPre", "BufNewFile"},
      dependencies = {
         'williamboman/mason.nvim',
         'hrsh7th/cmp-nvim-lsp',
         'neovim/nvim-lspconfig',
      },
      config = function()
         local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
         local default_setup = function(server)
            require('lspconfig')[server].setup({
               capabilities = lsp_capabilities,
            })
         end
         require('mason-lspconfig').setup({
            ensure_installed = {
               'clangd',
               'cmake',
               'pyright',
               'opencl_ls',
               'lua_ls',
            },
            handlers = {
               default_setup,
               lua_ls = function()
                  require('lspconfig').lua_ls.setup({
                     capabilities = lsp_capabilities,
                     settings = {
                        Lua = {
                           runtime = {
                              version = 'LuaJIT'
                           },
                           diagnostics = {
                              globals = {'vim'},
                           },
                           workspace = {
                              library = {
                                 vim.env.VIMRUNTIME,
                              }
                           }
                        }
                     }
                  })
                  require('lspconfig').pyright.setup({
                     capabilities = lsp_capabilities,
                     settings = {
                        python = {
                           -- ensure correct imports
                           pythonPath = vim.fn.exepath("python3.12"),
                        },
                     }
                  })
               end,
            },
         })
      end,
   },
}
