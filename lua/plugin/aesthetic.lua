return {
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        lazy = false,
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                light_style = "day", -- The theme is used when the background is set to light
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    -- floats = "dark", -- style for floating windows
                    floats = "transparent", -- style for floating windows
                },
                sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = false, -- dims inactive windows
                lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

                --- You can override specific color groups to use other groups or a hex color
                --- function will be called with a ColorScheme table
                ---@param cl ColorScheme
                on_colors = function(cl)
                    --colors.hint = colors.orange
                    cl.error = "#ff0000"
                    cl.green = "#999999" -- a dirty way to recolor strings
                    --cl.comment = "#636da6"
                end,

                --- You can override specific highlights to use other groups or a hex color
                --- function will be called with a Highlights and ColorScheme table
                ---@param hl Highlights
                ---@param cl ColorScheme
                on_highlights = function(hl, cl)
                end,

            })
            vim.cmd [[colorscheme tokyonight]]
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        as = 'lualine',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()

            local custom_moonfly = require'lualine.themes.moonfly'
            -- Change the background of lualine_c section for normal mode
            custom_moonfly.normal.c.bg = nil
            -- custom_moonfly.bg = nil

            require('lualine').setup({
                options = {
                    theme = custom_moonfly,
                    icons_enabled = false,
                },
                sections = {
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { "os.date('%X')"},
                },
                -- winbar = {
                --     lualine_a = { "buffers"},
                --     lualine_x = {},
                --     lualine_y = {},
                --     lualine_z = { "os.date('%X')"},
                -- },
                -- inactive_winbar = {
                --     lualine_a = { "buffers"},
                --     lualine_x = {},
                --     lualine_y = {},
                --     lualine_z = { "os.date('%X')"},
                -- },
                -- sections = {},
            })
        end,
    }
}
