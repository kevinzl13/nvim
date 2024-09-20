return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8', -- or branch = '0.1.x',
	event = "VeryLazy",
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope-file-browser.nvim",
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		},
		{
			"polirritmico/telescope-lazy-plugins.nvim",
			keys = {
				{
					"<leader>cp",
					"<Cmd>Telescope lazy_plugins<CR>",
					desc = "Telescope: Plugins configurations"
				},
			},
		},
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,       -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		}
	},
}
