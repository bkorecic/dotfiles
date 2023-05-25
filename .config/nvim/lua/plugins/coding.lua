return {
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
