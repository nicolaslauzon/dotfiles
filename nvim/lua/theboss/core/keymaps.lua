vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('n', '<leader>+', '<C-a>') -- increment
keymap.set('n', '<leader>-', '<C-x>') -- decrement

-- telescope
keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>') -- find files within current working directory, respects .gitignore
keymap.set('n', '<leader>s', '<cmd>Telescope live_grep<cr>') -- find string in current working directory as you type
keymap.set('n', '<leader>f', '<cmd>Telescope grep_string<cr>') -- find string under cursor in current working directory

-- nvim-tree
keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
