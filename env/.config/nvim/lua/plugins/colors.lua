return {
    {
        dir = vim.fn.stdpath("config"),
        name = "black",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme black")
        end,
    },
    {
        dir = vim.fn.stdpath("config"),
        name = "ubuntu",
        lazy = true,
        config = function()
            vim.cmd("colorscheme ubuntu")
        end,
    },
}
