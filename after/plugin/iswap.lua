require('iswap').setup{
  -- The keys that will be used as a selection, in order
  -- ('asdfghjklqwertyuiopzxcvbnm' by default)
  keys = 'asdfghjklqwertyuiopzxcvbnm',

  -- Grey out the rest of the text when making a selection
  -- (enabled by default)
  grey = 'disable',

  -- Highlight group for the sniping value (asdf etc.)
  -- default 'Search'
  hl_snipe = 'ErrorMsg',

  -- Highlight group for the visual selection of terms
  -- default 'Visual'
  hl_selection = 'Visual',

  -- Highlight group for the greyed background
  -- default 'Comment'
  hl_grey = 'Comment',

  -- Post-operation flashing highlight style,
  -- either 'simultaneous' or 'sequential', or false to disable
  -- default 'sequential'
  flash_style = false,

  -- Highlight group for flashing highlight afterward
  -- default 'IncSearch'
  --hl_flash = 'ModeMsg',
  hl_flash = 'IncSearch',

  -- Move cursor to the other element in ISwap*With commands
  -- default false
  move_cursor = false,

  -- Automatically swap with only two arguments
  -- default nil
  autoswap = true,
}
vim.keymap.set("n", "<leader>is", "<cmd>ISwapWith<CR>")
vim.keymap.set("n", "<leader>in", "<cmd>ISwapNodeWith<CR>")
vim.keymap.set("n", "<leader>ma", "<cmd>IMoveWith<CR>")
vim.keymap.set("n", "<leader>mn", "<cmd>IMoveNodeWith<CR>")
