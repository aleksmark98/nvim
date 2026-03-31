return {
   {
      "folke/tokyonight.nvim",
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
               cl.error = "#ff0000"
               cl.green = "#999999" -- a dirty way to recolor strings
            end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---@param hl Highlights
            ---@param cl ColorScheme
            on_highlights = function(hl, cl)
               hl.WinSeparator = {
                  bold = true,
                  fg = cl.fg_dark,
               }
               hl.LineNr = {
                  fg = cl.fg_dark,
               }
               hl.TelescopeNormal = {
                  fg = cl.fg_dark,
               }
               hl.TelescopeBorder = {
                  fg = cl.bg_dark,
               }
            end,
         })
         vim.cmd([[colorscheme tokyonight]])
      end,
   },
   {
      "nvim-lualine/lualine.nvim",
      as = "lualine",
      priority = 1000,
      lazy = false,
      -- event = "VeryLazy",
      -- dependencies = { "nvim-tree/nvim-web-devicons",{'kdheepak/tabline.nvim', opts={options={show_tabs_only = true}}}, opt = true, lazy = true },
      dependencies = { "nvim-tree/nvim-web-devicons", opt = true, lazy = false },
      config = function()
         local custom_moonfly = require("lualine.themes.moonfly")
         local darkgray = "#1f1f1f"
         local blue = "#83a5f8"
         custom_moonfly.normal.a.bg = "#bbbbbb"
         custom_moonfly.normal.b.bg = darkgray
         custom_moonfly.normal.c.bg = darkgray
         custom_moonfly.visual.a.bg = blue

         -- disable tabline, as tabs are in lualine
         -- vim.o.showtabline = 0
         -- vim.o.laststatus = 0

         require("lualine").setup({
            options = {
               always_show_tabline = true, -- When set to true, if you have configured lualine for displaying tabline

               theme = custom_moonfly,
               icons_enabled = false,
               section_separators = { left = "", right = "" },
               component_separators = { left = "", right = "" },
            },
            -- sections = {
            --    lualine_a = { "mode" },
            --    lualine_b = { "branch", "diff", "diagnostics" },
            --    lualine_c = {
            --       {
            --          "tabs",
            --          mode = 1, -- shows tabname
            --          path = 1, -- relative path
            --       },
            --    },
            --    lualine_x = {},
            --    lualine_y = { "searchcount", "selectioncount" },
            --    lualine_z = { "location", "progress" },
            -- },

            sections = {},
            inactive_sections = {},
            tabline = {
               lualine_a = { "mode" },
               lualine_b = { "branch", "diff", "diagnostics" },
               lualine_c = {
                  {
                     "tabs",
                     mode = 1, -- shows tabname
                     path = 1, -- relative path
                  },
               },
               lualine_x = {},
               lualine_y = { "searchcount", "selectioncount" },
               lualine_z = { "location", "progress" },
            },
         })
      end,
   },
}
