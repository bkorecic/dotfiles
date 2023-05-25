local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
	-- Lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "icons",
				},
				severity_sort = true,
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- diagnostics
			for name, icon in pairs(require("config").icons.diagnostics) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end

			if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
				opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
					or function(diagnostic)
						local icons = require("lazyvim.config").icons.diagnostics
						for d, icon in pairs(icons) do
							if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
								return icon
							end
						end
					end
			end

			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

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
