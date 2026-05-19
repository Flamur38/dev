
-- my colorscheme
return {
  {
    dir = vim.fn.stdpath("config"),
    name = "green",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme green")
    end,
  }
}

