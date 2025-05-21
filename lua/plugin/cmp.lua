return {
   {
      'hrsh7th/nvim-cmp',
      dependencies = {
         'hrsh7th/cmp-cmdline',
         'hrsh7th/cmp-buffer',
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-calc",
         {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            version = "v2.*",
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
            config = function()
               -- custom snippets
               -- require('config.snippets')
            end,
         },
         -- for autocompletion
         "saadparwaiz1/cmp_luasnip",
      },
      event = "InsertEnter",
      config = function()
         local cmp = require('cmp')
         local luasnip = require('luasnip')
         cmp.setup({
            sources = cmp.config.sources({
               { name = "nvim_lsp" },
               { name = "luasnip" },
               { name = "buffer" },
               { name = "path" },
               { name = "calc" },
            }),
            mapping = cmp.mapping.preset.insert({
               ['<CR>'] = cmp.mapping.confirm({select = false}),
               ['<C-e>'] = cmp.mapping.abort(),
               ['<C-b>'] = cmp.mapping.scroll_docs(-4),
               ['<C-f>'] = cmp.mapping.scroll_docs(4),
               ["<Tab>"] = cmp.mapping(function(fallback)
                  if luasnip.locally_jumpable(1) then
                     luasnip.jump(1)
                  else
                     fallback()
                  end
               end, { "i", "s" }),
               ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if luasnip.locally_jumpable(-1) then
                     luasnip.jump(-1)
                  else
                     fallback()
                  end
               end, { "i", "s" }),
            }),
            snippet = {
               expand = function(args)
                  require('luasnip').lsp_expand(args.body)
               end,
            },
         })
         cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
               {
                  { name = 'path' }
               },
               {
                  {
                     name = 'cmdline',
                     option = {
                        ignore_cmds = { 'Man', '!' }
                     }
                  }
               }
            )
         })
         cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
               { name = 'buffer' }
            }
         })
      end,
   },
}
