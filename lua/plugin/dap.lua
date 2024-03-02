-- return{}
return {
    {
        "mfussenegger/nvim-dap",
        event = {"BufReadPre", "BufNewFile"},
    },
    {
        "mfussenegger/nvim-dap-python",
        event = {"BufReadPre", "BufNewFile"},
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        -- config = function (_, opts)
        --     -- this installation of python doesn't have packages installed
        --     -- to properly use DAP I should modify my workflow to use VENVs
        --     local path = "~/AppData/Local/nvim-data/mason/packages/debugpy/venv/Scripts/python"
        --     require("dap-python").setup(path)
        -- end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            require'mason-nvim-dap'.setup({
                ensure_installed = {
                    "codelldb",
                    "pyright",
                    "debugpy",

                }
            })
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {"mfussenegger/nvim-dap"},
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
            vim.keymap.set('n', '<S-F9>', function() require('dap').toggle_breakpoint() end)
            vim.keymap.set('n', '<S-F10>', function() require('dap').step_over() end)
            vim.keymap.set('n', '<S-F11>', function() require('dap').step_into() end)
            vim.keymap.set('n', '<S-F12>', function() require('dap').step_out() end)
            vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end)
            vim.keymap.set('n', '<Leader>db', function() require('dap').set_breakpoint() end)
            vim.keymap.set('n', '<Leader>dlb', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
            vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
            vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
            vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
                require('dap.ui.widgets').hover()
            end)
            vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
                require('dap.ui.widgets').preview()
            end)
            vim.keymap.set('n', '<Leader>df', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end)
            vim.keymap.set('n', '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end)
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        event = {"BufReadPre", "BufNewFile"},
    },
}
