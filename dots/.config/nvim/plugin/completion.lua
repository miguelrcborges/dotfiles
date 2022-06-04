require('cmp').setup({


  snippet = {
    expan = function(args)
      vim.fn["vsnip$anonymous"](args.body)
    end,
  },


  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },

})
