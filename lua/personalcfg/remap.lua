vim.g.mapleader = " "
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

vim.keymap.set("n", "<leader>h", function()
    vim.cmd("set hlsearch!")
end)

-- move a selection up and down (autoindents)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<C>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- personally hardly ever need pasted over text
vim.keymap.set("x", "p", [["_dp]])
vim.keymap.set("x", "P", [["_dP]])

-- system clipboard pasting
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leder>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<C>zz")

-- start replacing word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--sth with creating an executable, idk might understand and use later
--vim.keygap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- move to an open buffer
vim.keymap.set("n", "<leader>b", ":ls<cr>:b<space>")

-- easier windows management
vim.keymap.set({ "n", "v"}, "<A-h>", "<C-w>h")
vim.keymap.set({ "n", "v"}, "<A-j>", "<C-w>j")
vim.keymap.set({ "n", "v"}, "<A-k>", "<C-w>k")
vim.keymap.set({ "n", "v"}, "<A-l>", "<C-w>l")

vim.keymap.set("n", "<F5>", "<cmd>vertical resize -4<CR>")
vim.keymap.set("n", "<F6>", "<cmd>resize +4<CR>")
vim.keymap.set("n", "<F7>", "<cmd>resize -4<CR>")
vim.keymap.set("n", "<F8>", "<cmd>vertical resize +4<CR>")
-- this goofy map is bcuz resize doesn't fully hide cmdline
vim.keymap.set("n", "<leader><F6>", "<cmd>set cmdheight=0<CR>")
