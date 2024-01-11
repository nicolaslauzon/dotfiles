return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'cpp', 'python', 'javascript', 'html' },
      sync_install = false,
      highlight = { enable = true },
      auto_install = true,
      indent = { enable = true },
    })
  end,
}
