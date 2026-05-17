
-- my colorscheme
return {
  {
    dir = vim.fn.stdpath("config"),
    name = "fl4my_cold",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme fl4my_cold")
    end,
  }
}

