return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('nvim-treesitter.config').setup({
      ensure_installed = {
        'lua',
        'python',
        'go',
        'bash',
        'json',
        'yaml',
      },
      auto_install = true,
    })
    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end
}
