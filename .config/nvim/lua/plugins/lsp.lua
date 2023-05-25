local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
	-- Lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = lsp_capabilities,
					})
				end,
			})
		end,
	},
	-- Mason
	{ "williamboman/mason.nvim", config = true, build = ":MasonUpdate" },
	{ "williamboman/mason-lspconfig.nvim", config = true },

	-- null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = {
			on_attach = function(client, bufnr) -- Auto format on save (https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		opts = {
			automatic_setup = true, -- Setup sources found installed in mason
			handlers = {}, -- Automatically register sources in null-ls
		},
	},
}
