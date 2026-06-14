-- Debug Adapter Protocol
return {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    dependencies = {
        'mfussenegger/nvim-dap-python',          -- python adapter glue
        'rcarriga/nvim-dap-ui',                  -- variables/stack/breakpoints panels
        'nvim-neotest/nvim-nio',                 -- required by dap-ui
        'theHamsta/nvim-dap-virtual-text',       -- inline variable values
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        -- point dap-python at Mason's debugpy install
        require('dap-python').setup(
            vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python'
        )

        dapui.setup()
        require('nvim-dap-virtual-text').setup({})

        -- auto open/close the UI with the debug session
        dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
        dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
        dap.listeners.before.event_exited['dapui_config']     = function() dapui.close() end

        -- keymaps
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)  -- set/remove breakpoint
        vim.keymap.set('n', '<leader>dc', dap.continue)           -- start / continue
        vim.keymap.set('n', '<leader>do', dap.step_over)          -- next line
        vim.keymap.set('n', '<leader>di', dap.step_into)          -- enter the function call
        vim.keymap.set('n', '<leader>du', dap.step_out)           -- finish current function
        vim.keymap.set('n', '<leader>dr', dap.repl.toggle)        -- debug repl
        vim.keymap.set('n', '<leader>dq', dap.terminate)          -- kill session
        vim.keymap.set('n', '<leader>dK', function() require('dapui').eval() end) -- inspect under cursor
    end,
}
