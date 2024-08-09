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
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	end,
	keys = {
		{
			"<leader>rp",
			function()
				require("telescope.builtin").find_files({
					prompt_title = "Plugins",
					cwd = vim.fn.stdpath("config") .. "/lua/plugins",
					attach_mappings = function(_, map)
						local actions = require("telescope.actions")
						local action_state = require("telescope.actions.state")
						map("i", "<c-y>", function(prompt_bufnr)
							local new_plugin = action_state.get_current_line()
							actions.close(prompt_bufnr)
							vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua",
								new_plugin))
						end)
						return true
					end
				})
			end
		},
	}

}
