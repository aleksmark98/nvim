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

-- this clashes with LSP and I can't be bothered to resolve it
-- vim.keymap.set({ "n", "v"}, "H", "<C-w>h")
-- vim.keymap.set({ "n", "v"}, "J", "<C-w>j")
-- vim.keymap.set({ "n", "v"}, "K", "<C-w>k")
-- vim.keymap.set({ "n", "v"}, "L", "<C-w>l")
-- easier window navigation
vim.keymap.set({"n", "v"}, "<C-h>", "<C-w>h")
vim.keymap.set({"n", "v"}, "<C-j>", "<C-w>j")
vim.keymap.set({"n", "v"}, "<C-k>", "<C-w>k")
vim.keymap.set({"n", "v"}, "<C-l>", "<C-w>l")
-- vim.keymap.set({ "n", "v"}, "1<leader>", "<cmd>1wincmd w<CR>")
-- vim.keymap.set({ "n", "v"}, "2<leader>", "<cmd>2wincmd w<CR>")
-- vim.keymap.set({ "n", "v"}, "3<leader>", "<cmd>3wincmd w<CR>")
-- vim.keymap.set({ "n", "v"}, "4<leader>", "<cmd>4wincmd w<CR>")
-- vim.keymap.set({ "n", "v"}, "5<leader>", "<cmd>5wincmd w<CR>")
-- vim.keymap.set({ "n", "v"}, "6<leader>", "<cmd>6wincmd w<CR>")

-- vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
-- vim.keymap.set("n", "<leader>ss", "<cmd>split<CR><C-W>w")
-- vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR><C-W>w")

vim.keymap.set("n", "<S-F5>", "<cmd>vertical resize -4<CR>")
vim.keymap.set("n", "<S-F6>", "<cmd>resize +4<CR>")
vim.keymap.set("n", "<S-F7>", "<cmd>resize -4<CR>")
vim.keymap.set("n", "<S-F8>", "<cmd>vertical resize +4<CR>")
-- this goofy map is bcuz resize doesn't fully hide cmdline
vim.keymap.set("n", "<leader><F6>", "<cmd>set cmdheight=0<CR>")

-- move a selection up and down (autoindents)
-- vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
