return {
  {
    'nvim-telescope/telescope-ui-select.nvim',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup({
        defaults = {
          extensions = {
            ['ui-select'] = {
              require('telescope.themes').get_dropdown({}),
            },
          },
          mappings = {
            i = {
              ['<C-k>'] = actions.move_selection_previous, -- move to prev result
              ['<C-j>'] = actions.move_selection_next, -- move to next result
            },
          },
          file_ignore_patterns = {
            "node_modules",
            "build",
            "install",
            "log",
          },
        },
      })

      require('telescope').load_extension('ui-select')
    end,
  },
}
