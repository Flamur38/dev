
-- my colorscheme
return {
    -- {
        --   dir = vim.fn.stdpath("config"),
        --   name = "green",
        --   lazy = false,
        --   priority = 1000,
        --   config = function()
            --     vim.cmd("colorscheme green")
            --   end,
            -- }
            {
                "rose-pine/neovim",
                name = "rose-pine",
                lazy = false,
                priority = 1000,
                config = function()
                    require("rose-pine").setup({
                        disable_background = true,
                        styles = {
                            italic = false,
                        },
                        highlight_groups = {
                            CursorLine = { bg = "NONE" },
                            StatusLine = { bg = "NONE" },
                        },

                    })
                    vim.cmd("colorscheme rose-pine")
                end,
            },
        }

