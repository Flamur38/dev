-- ~/.config/nvim/lua/plugins/rose-pine.lua

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,

    config = function()
      require("rose-pine").setup({
        variant = "moon", -- main, moon, dawn
        dark_variant = "moon",

        disable_background = false,
        disable_float_background = false,
        disable_italics = false,

        styles = {
          italic = true,
          transparency = false,
        },

        highlight_groups = {
          CursorLine = { bg = "#232136" },
          StatusLine = { fg = "love", bg = "love", blend = 10 },
        },
      })

      vim.cmd("colorscheme rose-pine")
    end,
  },
}
