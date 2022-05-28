set nocompatible

filetype on

filetype plugin on

filetype indent on

" Turn syntax highlighting on
syntax on

" Indention Options
set expandtab
set filetype indent on
set autoindent


set exrc
set incsearch

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

set laststatus=2
set noerrorbells
set title

set history=5000

