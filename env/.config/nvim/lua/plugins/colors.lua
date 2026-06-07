-- ~/.config/nvim/lua/plugins/rose-pine.lua

-- return {
--   {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     priority = 1000,
--
--     config = function()
--       require("rose-pine").setup({
--         variant = "moon", -- main, moon, dawn
--         dark_variant = "moon",
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
--             StatusLine = { fg = "muted", bg = "none", bold = true },
--         },
--       })
--
--       vim.cmd("colorscheme rose-pine")
--     end,
--   },
-- }

-- return {
--     {
--         "kaiuri/nvim-juliana",
--         priority = 1000,
--         lazy = false,
--         config = function()
--             vim.cmd.colorscheme("juliana")
--         end,
--     },
-- }

-- return {
--     "nickkadutskyi/jb.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--         -- require("jb").setup({transparent = true})
--         vim.cmd("colorscheme jb")
--     end,
-- }

return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      })

      vim.cmd("colorscheme nightfox")
    end,
  },
}

