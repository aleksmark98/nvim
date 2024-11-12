return {
    "yorickpeterse/nvim-window",
    keys = {
        { "<leader>w", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
    },
    config = function()

        require('nvim-window').setup({
          -- The characters available for hinting windows.
          chars = {
            'a', 's', 'd', 'f', 'j', 'k', 'l', ':', 'h', 'g',
            'q', 'w', 'e', 'r', 'u', 'i', 'o', 'p', 'y', 't', ':',

          },
        })
    end,
}
