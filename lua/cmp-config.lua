local cmp = require("cmp")

cmp.setup({
	-- Add Dadbod complete
	vim.api.nvim_create_autocmd({"FileType"}, {
		pattern = {"sql","mysql","plsql"},
		callback = function()
		require('cmp').setup.buffer({sources = {{ name = 'vim-dadbod-completion' }} } )
		end
	}),

	snippet = {
		expand = function(args)
		require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		--view = 'wildmenu',
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = 'nvim-lsp-signature-help' },
	}, {
		{ name = 'buffer' },
	})
})

   -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
   -- Set configuration for specific filetype.
   --[[ cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
	  { name = 'git' },
	}, {
	  { name = 'buffer' },
	})
  })
  require("cmp_git").setup() ]]-- 

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['vimls'].setup {
--  capabilities = capabilities
--}
--require('lspconfig')['tsserver'].setup {
--  capabilities = capabilities
--}
--require('lspconfig')['omnisharp'].setup {
--  capabilities = capabilities
--}
