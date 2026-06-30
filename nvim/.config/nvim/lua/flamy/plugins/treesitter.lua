-- Newer nvim-treesitter uses vim.treesitter directly
-- no longer requires 'nvim-treesitter.configs'

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            vim.treesitter.language.setup = vim.treesitter.language.setup or function() end

            require("nvim-treesitter").setup({
                ensure_installed = {
                    "lua",
                    "python",
                    "bash",
                    "go",
                    "json",
                    "yaml",
                },
                highlight = { enable = true },
                indent = { enable = true },
                auto_install = true,
            })
        end,
    },
}
