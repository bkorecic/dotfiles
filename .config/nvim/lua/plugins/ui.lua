return {
	{ 'nvim-lualine/lualine.nvim',
		opts = {
			extensions = {
				'nvim-tree',
			},
		}
	},
	{ 'nvim-tree/nvim-tree.lua', config=true },
	'nvim-tree/nvim-web-devicons',
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		dependencies = { 
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
	}
}
