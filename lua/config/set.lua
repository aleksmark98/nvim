--vim.opt.guicursor = ""
vim.g.python_host_prog = '/opt/homebrew/bin/python3'
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'

vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 1
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

-- hide command line - appear over the statusline when used
vim.o.cmdheight = 0
vim.opt.laststatus = 3

vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.scroll = 15

vim.opt.signcolumn = "number"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- visual help for line length limit
--vim.opt.colorcolumn = "80"

vim.opt.splitbelow = true
vim.opt.splitright = true


-- LSP SETTINGS
vim.diagnostic.config({
   virtual_text = {current_line = true },
   signs = {},
})
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = 'single'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
