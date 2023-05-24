return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'williamboman/mason-lspconfig.nvim',
		},
		config = function()
			local lspconfig = require('lspconfig')
			local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

			require('mason-lspconfig').setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = lsp_capabilities,
					})
				end,
			})
		end,
	}
}
