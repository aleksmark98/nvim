-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
-- vim.keymap.set('n', '<C-w>d', '<cmd>lua vim.diagnostic.open_float({border="single"})<cr>')

-- vim.api.nvim_create_autocmd('LspAttach', {
--    desc = 'LSP actions',
   -- callback = function(event)
      -- -- neovim 0.11 completion
      -- local client = vim.lsp.get_client_by_id(event.data.client_id)
      -- if client:supports_method('textDocument/completion') then
      --    vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true})
      -- end

      -- local opts = {buffer = event.buf}
      -- these will be buffer-local keybindings
      -- because they only work if you have an active language server
      -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      -- vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
   -- end
-- })

vim.diagnostic.config({ virtual_text = {current_line = true } })
-- vim.o.winborder = 'single' -- this breaks floating cmdline
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = 'single'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
   require('lspconfig')[server].setup({
      capabilities = lsp_capabilities,
   })
end

require('mason').setup({})
require('mason-lspconfig').setup({
   ensure_installed = {
      'clangd',
      'cmake',
      'pyright',
      -- 'matlab_ls',
      --'r_language_server', -- throws an error
      'opencl_ls',
      'lua_ls',
      -- 'texlab',
      -- 'dockerls',
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

