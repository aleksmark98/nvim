vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<leader>ih", function()
    vim.cmd("set hlsearch!")
end)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

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

-- TODO quickfix bindings
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<C>zz")

--TODO sth with creating an executable, idk might understand and use later
--vim.keygap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<up>"  , "<cmd>resize +4<CR>")
vim.keymap.set("n", "<down>", "<cmd>resize -4<CR>")
vim.keymap.set("n", "<left>" , "<cmd>vertical resize -4<CR>")
vim.keymap.set("n", "<right>", "<cmd>vertical resize +4<CR>")

vim.keymap.set({"n", "v"}, "H", "^")
vim.keymap.set({"n", "v"}, "L", "$")

vim.keymap.set("n", "<leader>:"  , "<cmd>call setline('.', getline('.') . ';')<CR>")
