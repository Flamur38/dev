-- -- fl4my_green is a fully custom theme living in colors/fl4my_green.lua
-- -- Neovim finds it automatically — no plugin needed
-- local function ColorMyPencils(color)
--     color = color or "fl4my_juliana"
--     vim.cmd.colorscheme(color)
-- end
--
-- -- call it immediately when this file is loaded by lazy.nvim
-- ColorMyPencils()
--
-- return {
--     {
--         "kaiuri/nvim-juliana",                       -- kept as a fallback option
--         lazy = true,
--     },
-- }
--



-- change this line to switch themes: "fl4my_juliana", "fl4my_term", "rose-pine"
local DEFAULT = "flamy"

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {
            variant = "main",                  -- main | moon | dawn
            styles = {
                bold = true,
                italic = false,
                transparency = false,
            },
        },
        config = function(_, opts)
            require("rose-pine").setup(opts)
            vim.cmd.colorscheme(DEFAULT)       -- runs after the plugin is loaded
        end,
    },
    {
        "kaiuri/nvim-juliana",                 -- kept as a fallback option
        lazy = true,
    },
}
