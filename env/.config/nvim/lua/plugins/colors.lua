
return {
  {
    "kaiuri/nvim-juliana",
    lazy = false,
    priority = 1000,
    config = function()
      require("nvim-juliana").setup({})
      vim.cmd("colorscheme juliana")
      -- transparent bg
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      -- transparent statusline
-- transparent gutter
      vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f97b58", bg = "none", bold = true })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
    end,
  },
}

-- ~/.config/nvim/lua/plugins/rose-pine.lua

-- return {
--   {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     priority = 1000,
--
--     config = function()
--       require("rose-pine").setup({
--         variant = "main", -- main, moon, dawn
--         dark_variant = "main",
--
--         disable_background = true,
--         disable_float_background = false,
--         disable_italics = false,
--
--         styles = {
--           italic = true,
--           transparency = false,
--         },
--
--         highlight_groups = {
--           -- CursorLine = { bg = false },
--           -- StatusLine = { fg = "text", bg = "base", blend = 10 },
--             StatusLine = { fg = "base", bg = "muted", bold = true },
--         },
--       })
--
--       vim.cmd("colorscheme rose-pine")
--     end,
--   },
-- }

-- ~/.config/nvim/lua/plugins/juliana.lua

