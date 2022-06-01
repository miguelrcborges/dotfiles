" Set tabsize to 2 spaces
set shiftwidth=2
set tabstop=2
set expandtab

syntax on " Syntax highlight
set ruler " Always shows location in file (line#)
set smarttab " Autotabs for certain code
"set termguicolors 

set number
set relativenumber

set noerrorbells " LOL
set noswapfile " 

set nowrap
set ignorecase
set smartcase
set incsearch " Highlight while building search expression
set scrolloff=8


" Start loading plugins
call plug#begin()

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'preservim/nerdtree'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

call plug#end()

let g:tokyonight_style = "night"
colorscheme tokyonight
