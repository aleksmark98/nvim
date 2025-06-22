vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<leader>ih", function()
    vim.cmd("set hlsearch!")
end)

-- make the default visual paste not overwrite the unnamed register
vim.keymap.set("v", "p", "P")
vim.keymap.set("v", "P", "p")
-- system clipboard pasting
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>P", [["+P]])

-- hitting Q more often  than using macros
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<up>"  , "<cmd>resize +4<CR>")
vim.keymap.set("n", "<down>", "<cmd>resize -4<CR>")
vim.keymap.set("n", "<left>" , "<cmd>vertical resize -4<CR>")
vim.keymap.set("n", "<right>", "<cmd>vertical resize +4<CR>")

vim.keymap.set({"n", "v"}, "H", "^")
vim.keymap.set({"n", "v"}, "L", "$")

vim.keymap.set("n", "<leader>:"  , "<cmd>call setline('.', getline('.') . ';')<CR>")

-- cmd map: "tdiag" to [t]oggle [diag]nostics
vim.cmd("cnoreabbrev tdiag lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())")

vim.cmd("cnoreabbrev viewopt lua print(vim.inspect(vim.opt.")

-- LSP MAPPINGS
-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
-- vim.keymap.set('n', '<C-w>d', '<cmd>lua vim.diagnostic.open_float({border="single"})<cr>')
vim.api.nvim_create_autocmd('LspAttach', {
   desc = 'LSP actions',
   callback = function(event)
      -- neovim 0.11 completion
      -- local client = vim.lsp.get_client_by_id(event.data.client_id)
      -- if client:supports_method('textDocument/completion') then
      --    vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true})
      -- end

      local opts = {buffer = event.buf}
      -- these will be buffer-local keybindings
      -- because they only work if you have an active language server
      -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      -- vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
   end
})
