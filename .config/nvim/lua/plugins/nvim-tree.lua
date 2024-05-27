return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    require('nvim-tree').setup({
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      git = {
        ignore = false,
        enable = true,
      },
      filters = {
        dotfiles = true,
        custom = { '.git', '.cache', 'build', 'log', 'install' },
      },
    })
  end,
}
