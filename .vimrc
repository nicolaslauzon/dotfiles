syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
:set number relativenumber
:set nu rnu
inoremap kj <Esc>



set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
call plug#end()

colorscheme dracula
set background=dark
let c_no_curly_error = 1
let g:cpp_simple_highlight = 1
let g:cpp_named_requirements_highlight = 1
