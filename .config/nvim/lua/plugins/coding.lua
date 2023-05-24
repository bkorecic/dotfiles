return {
	-- Mason
	{ 'williamboman/mason.nvim', config = true, build = ':MasonUpdate' },
	{ 'williamboman/mason-lspconfig.nvim', config = true },
	-- Snippy
	{ 'dcampos/nvim-snippy', 
		opts = {
			mappings = {
				is = {
					['<Tab>'] = 'expand_or_advance',
					['<S-Tab>'] = 'previous',
				},
			}
		},
		config = true,
	},
}
