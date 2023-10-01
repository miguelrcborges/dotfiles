"""""""""""""""""""""""""""""""
"       Better defaults       "
"""""""""""""""""""""""""""""""
" Set tabsize to 2 spaces
set shiftwidth=2
set tabstop=2
" set expandtab " Commented because I want to insert tabs instead of spaces

syntax on " Syntax highlight
set ruler " Always shows location in file (line#)
set smarttab " Autotabs for certain code
set termguicolors 

set number
set relativenumber

set noerrorbells " LOL
set noswapfile 

set nowrap
set ignorecase
set smartcase
set incsearch " Highlight while building search expression
set scrolloff=8 
set sidescrolloff=30
set signcolumn=yes " Good to show erros with LSP



"""""""""""""""""""""""""""""""
"           Plugins           "
"""""""""""""""""""""""""""""""
call plug#begin()
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'

if has('nvim')
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/cmp-path'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

call plug#end()

colorscheme gruvbox-material



"""""""""""""""""""""""""""""""
"           Keybinds          "
"""""""""""""""""""""""""""""""
let mapleader=" "
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <S-j> :bprevious<CR>
nnoremap <S-k> :bnext<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>c :q<CR>
nnoremap <leader><S-c> :q!<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <leader><C-h> <C-w><S-h>
nnoremap <leader><C-j> <C-w><S-j>
nnoremap <leader><C-k> <C-w><S-k>
nnoremap <leader><C-l> <C-w><S-l>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :bdelete<CR>
nnoremap <leader><S-q> :bdelete!<CR>
nnoremap <leader>t :terminal<CR>

vnoremap > >gv
vnoremap < <gv

tnoremap <Esc><Esc> <C-\><C-n>


""""""""""""""""""""""""""""""""
"           LSP Config         "
"         (Neovim only)        "
""""""""""""""""""""""""""""""""
if has('nvim')
lua <<EOF
	lsp = require("lspconfig")

	local servers = { "gopls", "clangd", "tsserver", "html", "jsonls", "cssls" }

	local on_attach = function(client, bufnr)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		client.server_capabilities.semanticTokensProvider = nil
		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, bufopts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, bufopts)
	end


	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	for _, lsp in pairs(servers) do
		require("lspconfig")[lsp].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end
	

	local cmp = require("cmp")
	cmp.setup({

		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body)
			end,
		},


		sources = cmp.config.sources({
			{ name = "vsnip" },
			{ name = "nvim_lsp" },
			{ name = "path" },
		}, {
			{ name = "buffer" },
		}),

		mapping = {
			['<CR>'] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif vim.fn["vsnip#available"](1) == 1 then
					feedkey("<Plug>(vsnip-expand-or-jump)", "")
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_prev_item()
				elseif vim.fn["vsnip#jumpable"](-1) == 1 then
					feedkey("<Plug>(vsnip-jump-prev)", "")
				end
			end, { "i", "s" }),
		},
	})

	require("nvim-treesitter.configs").setup {
		highlight = {
			enable = true,
		},
		additional_vim_regex_highlighting = false,
	}
EOF
endif
