" Set tabsize to 2 spaces
set shiftwidth=2
set tabstop=2
set expandtab

syntax on " Syntax highlight
set ruler " Always shows location in file (line#)
set smarttab " Autotabs for certain code
set termguicolors 

set number
set relativenumber

set noerrorbells " LOL
set noswapfile " 

set nowrap
set ignorecase
set smartcase
set incsearch " Highlight while building search expression
set scrolloff=8
set sidescrolloff=30


" Start loading plugins
call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'neovim/nvim-lspconfig'

call plug#end()

let g:tokyonight_style = "night"
colorscheme tokyonight
