-- ColorMyPencils applies the colorscheme and strips the background
-- so your terminal/compositor background shows through (transparency)
-- Default is juliana, but it still accepts any colorscheme name as argument
local function ColorMyPencils(color)
    color = color or "juliana"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    -- transparent gutter
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f97b58", bg = "none", bold = true })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
end

return {
    -- Kept as an option to switch to if you ever want something different
    {
        "erikbackman/brightburn.vim",
    },
    {
        "kaiuri/nvim-juliana",                       -- Sublime Mariana port, default theme
        lazy = false,                                -- Load at startup
        priority = 1000,                             -- Load before all other plugins
        config = function()
            require("nvim-juliana").setup({})        -- Default Mariana palette
            ColorMyPencils()                         -- Applies juliana + transparency
        end,
    },
    {
        "rose-pine/neovim",                          -- Kept installed as a fallback option
        name = "rose-pine",
        lazy = false,
        config = function()
            require("rose-pine").setup({
                disable_background = true,   -- Lets your terminal bg show through
                styles = {
                    italic = false,          -- No italics anywhere
                },
            })
            -- No ColorMyPencils() call here, otherwise it would override juliana
        end,
    },
}
