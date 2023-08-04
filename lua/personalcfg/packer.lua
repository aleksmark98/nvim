--TODO comment plugin https://github.com/terrortylor/nvim-comment This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- prefer fzy sorting over fzf sorting
    -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} },
        -- config = function()
        --     require('telescope').load_extension('fzf')
        -- end
    }
    use ('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
    -- use ('nvim-treesitter/playground') -- show treesitter info, might use later
    use ('nvim-treesitter/nvim-treesitter-context') -- sticky function definitions
    use ('theprimeagen/harpoon')
    -- use ('mbbill/undotree') -- TODO: learn undotree
    use ('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
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
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                mappings = { extra = false },
            })
        end
    }
    use {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    }
    -- AESTHETICS
    ---- COLOR THEME
    use ('navarasu/onedark.nvim')
    ---- STATUSLINE
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
end)
