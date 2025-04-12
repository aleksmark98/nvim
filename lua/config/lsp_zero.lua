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
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = 'single'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

