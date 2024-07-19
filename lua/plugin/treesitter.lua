return {
{
    'nvim-treesitter/nvim-treesitter',
    -- event = 'BufEnter',
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        require'nvim-treesitter.configs'.setup {
            --
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "cpp", "r", "cuda", "lua", "vim", "vimdoc", "markdown", "latex", "python" },
            ignore_install = { "latex" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                -- additional_vim_regex_highlighting = false,
                additional_vim_regex_highlighting = {"latex"},
            },
            indent = {
                enable = true
            },
        }

        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldenable = false
        vim.opt.foldlevel = 99

        -- hack to enable folding in files opened with Telescope, see issue https://github.com/nvim-telescope/telescope.nvim/issues/699
        vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })
    end
},
    -- {'nvim-treesitter/playground'} -- show treesitter info, might use later
    {
        'nvim-treesitter/nvim-treesitter-context',
        -- event = 'BufEnter',
        event = {"BufReadPre", "BufNewFile"},
    }, -- sticky function definitions
    {
        'mizlan/iswap.nvim',
        -- event = 'BufEnter',
        event = {"BufReadPre", "BufNewFile"},
        config = function()
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
        end

    },
    {
        'stevearc/aerial.nvim',
        keys = {
            {'<F9>', '<cmd>AerialToggle! left<CR>'},
            {'[[', '<cmd>AerialPrev<CR>'},
            {']]', '<cmd>AerialNext<CR>'},
        },
        config = function()
            require('aerial').setup({
                backends = { "lsp", "treesitter", "markdown", "man" },
            })

            require('telescope').load_extension('aerial')
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        "kylechui/nvim-surround",
        -- event = 'BufEnter',
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
                keymaps = {
                    normal = "<leader>s",
                    visual = "<leader>s",
                }
            })
        end
    },
}
