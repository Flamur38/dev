-- fl4my_green is a fully custom theme living in colors/fl4my_green.lua
-- Neovim finds it automatically — no plugin needed
local function ColorMyPencils(color)
    color = color or "flamy_juliana"
    vim.cmd.colorscheme(color)
end

-- call it immediately when this file is loaded by lazy.nvim
ColorMyPencils()

return {
    {
        "kaiuri/nvim-juliana",                       -- kept as a fallback option
        lazy = true,
    },
}
