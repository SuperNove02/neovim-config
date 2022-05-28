set nocompatible

filetype on

filetype plugin on

filetype indent on

" Turn syntax highlighting on
syntax on


set exrc

set relativenumber
set nu
set hidden

set nohlsearch

set nowrap

" keeping history
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set incsearch

set scrolloff=8

set signcolumn=yes
set colorcolumn=80

" plugging
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'

call plug#end()

colorscheme gruvbox

