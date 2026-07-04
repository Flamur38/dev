-- ColorMyPencils applies the colorscheme and strips the background
-- so your terminal/compositor background shows through (transparency)
-- Default is juliana, but it still accepts any colorscheme name as argument

-- Helper: adds bold to an existing highlight group without changing its colors
local function bold_hl(group)
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    hl.bold = true
    vim.api.nvim_set_hl(0, group, hl)
end

local function ColorMyPencils(color)
    color = color or "juliana"
    vim.cmd.colorscheme(color)

    -- function highlights — bold only, preserves juliana colors
    bold_hl("@function")
    bold_hl("@function.call")
    bold_hl("@function.builtin")
    bold_hl("@method")
    bold_hl("@method.call")

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    -- -- transparent gutter
    -- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f97b58", bg = "none", bold = true })
    -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
end

return {
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
                disable_background = true,
                styles = {
                    italic = false,
                },
            })
        end,
    },
}
