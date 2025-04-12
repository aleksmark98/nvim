return {
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
   }, -- Optional
   -- Autocompletion
   {
      'hrsh7th/nvim-cmp',
      dependencies = {
         'hrsh7th/cmp-cmdline',
         'hrsh7th/cmp-buffer',
      },
      event = "VeryLazy",
      config = function()
         local cmp = require('cmp')
         cmp.setup({
            sources = {
               {name = 'nvim_lsp'},
            },
            mapping = cmp.mapping.preset.insert({
               ['<CR>'] = cmp.mapping.confirm({select = false}),
               ['<C-e>'] = cmp.mapping.abort(),
               ['<C-b>'] = cmp.mapping.scroll_docs(-4),
               ['<C-f>'] = cmp.mapping.scroll_docs(4),
            }),
            -- snippet = {
            --    expand = function(args)
            --       require('luasnip').lsp_expand(args.body)
            --    end,
            -- },
         })
         cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
               { name = 'path' }
            }, {
                  {
                     name = 'cmdline',
                     option = {
                        ignore_cmds = { 'Man', '!' }
                     }
                  }
               })
         })
         cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
               { name = 'buffer' }
            }
         })
      end,
   },
   {'L3MON4D3/LuaSnip'},
   {
      "ray-x/lsp_signature.nvim",
      event = {"BufReadPre", "BufNewFile"},
   },
}
