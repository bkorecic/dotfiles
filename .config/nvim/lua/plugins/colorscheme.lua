return {
	{ 
		'ellisonleao/gruvbox.nvim', 
		lazy = false,
		priority = 1000,
		opts = {
			contrast = 'hard',
		},
		init = function()
			vim.cmd('colorscheme gruvbox')
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = "all",
				highlight = { enable = true, }
			}
		end,
	}
}
