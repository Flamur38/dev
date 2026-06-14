return {
    'Exafunction/codeium.vim',
    lazy = false,
    config = function()
        vim.g.codeium_no_map_tab = 1
        vim.g.codeium_manual = true            -- only this, no codeium_enabled = false

        vim.keymap.set('i', '<C-g>', function()
            return vim.fn['codeium#Complete']()
        end, { expr = true, silent = true })

        vim.keymap.set('i', '<C-e>', function()
            return vim.fn['codeium#Clear']()
        end, { expr = true, silent = true })

        vim.keymap.set('i', '<C-y>', function()
            return vim.fn['codeium#Accept']()
        end, { expr = true, silent = true })

        vim.keymap.set('i', '<C-]>', function()
            return vim.fn['codeium#CycleCompletions'](1)
        end, { expr = true, silent = true })
    end
}
