--TODO comment plugin https://github.com/terrortylor/nvim-comment This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use ('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use ('nvim-treesitter/nvim-treesitter-context') -- sticky function definitions
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
              pcall(vim.cmd, 'MasonUpdate')
          end,
          },
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
      }
  }
use {
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    config = function()
        require('toggle_lsp_diagnostics').init()
    end
}
use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            mappings = { extra = false },
        })
    end
}

-------- AESTHETICS
---------- COLOR THEMES
--  use({
--      'rose-pine/neovim',
--      as = 'rose-pine',
--      config = function()
--    	  require("rose-pine").setup({ disable_italics = true, })
--
--    	  vim.cmd('colorscheme rose-pine')
--      end
--  })
-- use {
--     "rockyzhang24/arctic.nvim",
--     as = "arctic",
--     requires = {"rktjmp/lush.nvim"},
--      config = function()
--    	  require("arctic").setup({ disable_italics = true, })
--
--    	  vim.cmd('colorscheme arctic')
--      end
-- }
use ('navarasu/onedark.nvim')
---------- STATUSLINE
use {
  'nvim-lualine/lualine.nvim',
  as = 'lualine',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup({
       options = {
           theme = 'moonfly',
           icons_enabled = false,
       },
       sections = {
           lualine_x = {},
           lualine_y = {},
           lualine_z = { "os.date('%X')"},
       },
    })
  end,
}

-- TODO learn undotree
end)
