-- ColorMyPencils applies the colorscheme and strips the background
-- so your terminal/compositor background shows through (transparency)
-- It defaults to rose-pine-moon but accepts any colorscheme name as argument
local function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    -- Remove background from the main editor window
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

    -- Remove background from floating windows (LSP hover, diagnostics, etc.)
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    -- Kept as an option to switch to if you ever want something different
    {
        "erikbackman/brightburn.vim",
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,        -- Load at startup
        priority = 1000,     -- Load before all other plugins

        config = function()
            require("rose-pine").setup({
                disable_background = true,   -- Lets your terminal bg show through

                styles = {
                    italic = false,          -- No italics anywhere
                },
            })

            ColorMyPencils()
        end,
    },
}
