-- return {
--   "kaiuri/nvim-juliana",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("nvim-juliana").setup({
--       transparent = true,
--     })
--     vim.cmd("colorscheme juliana")
--     vim.cmd [[
--       highlight Normal      guibg=NONE ctermbg=NONE
--       highlight NormalNC    guibg=NONE ctermbg=NONE
--       highlight SignColumn  guibg=NONE ctermbg=NONE
--       highlight VertSplit   guibg=NONE ctermbg=NONE
--       highlight EndOfBuffer guibg=NONE ctermbg=NONE
--       highlight CursorLine     guibg=NONE ctermbg=NONE
--       highlight CursorLineNr   guibg=NONE ctermbg=NONE
--
--       highlight StatusLine   guibg=NONE ctermbg=NONE
--       highlight StatusLineNC guibg=NONE ctermbg=NONE
--     ]]
--   end,
-- }

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("rose-pine").setup({
--       variant = "main",
--       transparent = true,
--       terminal_colors = true,
--       styles = {
--         bold = true,
--         italic = true,
--         transparency = true,
--       },
--     })
--     vim.cmd("colorscheme rose-pine")
--     vim.cmd [[
--       highlight Normal      guibg=NONE ctermbg=NONE
--       highlight NormalNC    guibg=NONE ctermbg=NONE
--       highlight SignColumn  guibg=NONE ctermbg=NONE
--       highlight VertSplit   guibg=NONE ctermbg=NONE
--       highlight EndOfBuffer guibg=NONE ctermbg=NONE
--       highlight CursorLine     guibg=NONE ctermbg=NONE
--       highlight CursorLineNr   guibg=NONE ctermbg=NONE
--       highlight StatusLine   guibg=NONE ctermbg=NONE
--       highlight StatusLineNC guibg=NONE ctermbg=NONE
--     ]]
--   end,
-- }

return {
  {
    dir = vim.fn.stdpath("config"),
    name = "ubuntu",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme ubuntu")
    end,
  }
}
