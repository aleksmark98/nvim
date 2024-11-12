vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<leader>ih", function()
    vim.cmd("set hlsearch!")
end)

-- vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- make the default visual paste not overwrite the unnamed register
vim.keymap.set("v", "p", "P")
vim.keymap.set("v", "P", "p")

-- system clipboard pasting
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>P", [["+P]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quickfix bindings
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<C>zz")

-- start replacing word under cursor
vim.keymap.set("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--sth with creating an executable, idk might understand and use later
--vim.keygap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- move to an open buffer
--telescope can do this
--vim.keymap.set("n", "<leader>b", ":ls<cr>:b<space>")

-- easier window navigation
vim.keymap.set({"n", "v"}, "<C-h>", "<C-w>h")
vim.keymap.set({"n", "v"}, "<C-j>", "<C-w>j")
vim.keymap.set({"n", "v"}, "<C-k>", "<C-w>k")
vim.keymap.set({"n", "v"}, "<C-l>", "<C-w>l")
-- vim.keymap.set({"n", "v"}, "gh", "<C-w>h")
-- vim.keymap.set({"n", "v"}, "gj", "<C-w>j")
-- vim.keymap.set({"n", "v"}, "gk", "<C-w>k")
-- gl clashes with native vim.diagnostic.open_float() binding
-- vim.keymap.set({"n", "v"}, "gl", "<C-w>l")

vim.keymap.set("n", "<up>"  , "<cmd>resize +4<CR>")
vim.keymap.set("n", "<down>", "<cmd>resize -4<CR>")
vim.keymap.set("n", "<left>" , "<cmd>vertical resize -4<CR>")
vim.keymap.set("n", "<right>", "<cmd>vertical resize +4<CR>")
-- this goofy map is bcuz resize doesn't fully hide cmdline
vim.keymap.set("n", "<leader><down>", "<cmd>set cmdheight=0<CR>")

-- move a selection up and down (autoindents)
-- vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
