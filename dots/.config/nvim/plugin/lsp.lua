lsp = require("lspconfig")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.clangd.setup{ capabilities = capabilities }
lsp.gopls.setup{ capabilities = capabilities }
