--[[vim.cmd([[
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case i:lua =vim.lsp.get_active_clients()nsensitive 


" set title

set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          " sets relative numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

colorscheme gruvbox
]]--

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
  Plug 'morhetz/gruvbox'
  -- Dependencies for neo tree
  Plug "nvim-lua/plenary.nvim"
  Plug "nvim-tree/nvim-web-devicons" -- not strictly required, but recommende
  Plug "MunifTanjim/nui.nvim"
  Plug 'nvim-neo-tree/neo-tree.nvim'



  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'

vim.call('plug#end')

-- Color Scheme
vim.cmd('colorscheme gruvbox')



local lspconfig = require('lspconfig')
lspconfig.tsserver.setup({})
lspconfig.pyright.setup({})
lspconfig.lua_ls.setup({})


-- Keymap
--- Neotree

vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', {})
vim.keymap.set('n', '<C-n>n', ':Neotree filesystem reveal right<CR>', {})
