----
-- Options
----
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.fileformat = 'unix'
vim.opt.fileformats = 'unix'
vim.opt.endoffile = false
vim.opt.endofline = false

vim.opt.ruler = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true

vim.opt.autowrite = true
vim.opt.swapfile = false

vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 30

vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.wildmenu = true
vim.opt.path:append("**")

vim.opt.signcolumn = "yes"
vim.g.netrw_banner = 0
vim.opt.shellcmdflag = "-c" -- fix windows bash flag
vim.opt.shellxquote = ""    -- windows cope pt. 2


----
-- Depedencies
----
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"sainnhe/gruvbox-material",
		lazy = true,
		event = "VeryLazy",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox-material")
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				sync_install = false,
				highlight = { enable = true },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufRead", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function ()
			local lsps = { "clangd", "gopls" }
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local root = lspconfig.util.root_pattern(".git", "compile_flags.txt", "go.mod", "Gopkg.lock", ".")

			for _, s in pairs(lsps) do
				lspconfig[s].setup {
					root_dir = root,
					capabilities = capabilities,
				}
			end
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		lazy = true,
		event = "VeryLazy",
		config = function ()
			local cmp = require("cmp")
			local snip = require("luasnip")
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local s = snip.snippet
			local t = snip.text_node
			local i = snip.insert_node

			snip.add_snippets("go", { 
				s("iferr", {
					t({"if err != nil {", "\t"}),
					i(1),
					t({"", "}"})
				}),
				s("reterr", {
					t("return "),
					i(1),
					t("err")
				})
			})

			cmp.setup({
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif snip.expand_or_jumpable() then
							snip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif snip.jumpable(-1) then
							snip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				snippet = {
					expand = function(args)
						snip.lsp_expand(args.body)
					end
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
})


----
-- Keybinds
----
vim.g.mapleader = " "

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function (ev)
		local opts = { buffer = ev.buf }
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>fs", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
		vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
	end
})
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)

vim.keymap.set("n", "J", ":bprevious<CR>")     -- Overrided keybind moved to <C-j>
vim.keymap.set("n", "K", ":bnext<CR>")         -- Overrides checking man
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")   -- Overrided keybind moved to <C-j>
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")   -- Overrides checking man
vim.keymap.set({"n", "v"}, "<C-j>", "J")       -- Restoring overrided command 

vim.keymap.set("n", "<leader>s", ":split<CR>")
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>mh", "<C-w><S-h>")
vim.keymap.set("n", "<leader>mj", "<C-w><S-j>")
vim.keymap.set("n", "<leader>mk", "<C-w><S-k>")
vim.keymap.set("n", "<leader>ml", "<C-w><S-l>")
vim.keymap.set("n", "<leader>cw", ":clo<CR>")

vim.keymap.set("n", ">", ">>")   -- < expects a group (like <ip), so I'm removing options here
vim.keymap.set("n", "<", "<<")   -- ^^ (can still be done a visual selection beforehand)
vim.keymap.set("v", "<", "<gv") 
vim.keymap.set("v", ">", ">gv") 

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":bdelete<CR>")
vim.keymap.set("n", "<leader>Q", ":bdelete!<CR>")
vim.keymap.set("n", "<leader>t", ":terminal<CR>")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>P", [["+P]])
