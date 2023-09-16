--This file can be loaded by calling `lua require('plugins')` from your init.vim
--TODO add align

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
    use {"ray-x/lsp_signature.nvim"}
    use {
        'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
        config = function()
            require('toggle_lsp_diagnostics').init()
        end
    }
    -- DAP setup
    use { "mfussenegger/nvim-dap" }
    use {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require'mason-nvim-dap'.setup({
                ensure_installed = { "codelldb"}
            })
        end
    }
    use {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_inialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.after.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.after.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
    }
    use { "theHamsta/nvim-dap-virtual-text" }

    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    use { 'mizlan/iswap.nvim' }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                padding = false,
                mappings = { extra = false },
            })
        end
    }
    use {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    }
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- AESTHETICS
    ---- COLOR THEME
    --use ('navarasu/onedark.nvim')
    use ('folke/tokyonight.nvim')
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
