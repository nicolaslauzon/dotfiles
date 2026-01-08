vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('n', '<leader>+', '<C-a>') -- increment
keymap.set('n', '<leader>-', '<C-x>') -- decrement

-- telescope
keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>') -- find files within current working directory, respects .gitignore
keymap.set('n', '<leader>s', '<cmd>Telescope live_grep<cr>') -- find string in current working directory as you type
keymap.set('n', '<leader>f', '<cmd>Telescope grep_string<cr>') -- find string under cursor in current working directory

-- nvim-tree
keymap.set('n', '<leader>e', '<cmd>NvimTreeFocus<cr>')

-- vertical nav
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('n', '<leader>m', ':PeekOpen')
