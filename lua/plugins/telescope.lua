return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	-- require de dependencia en el sistema de ripgrep
	config = function()
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

		-- Configuración de Telescope
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next, -- Mover a la siguiente opción
						["<C-k>"] = actions.move_selection_previous, -- Mover a la opción anterior
						["<C-q>"] = actions.close, -- Cerrar Telescope
					},
				},
				file_ignore_patterns = {
					"node_modules/.*",
					"dist/.*",
					"build/.*",
					"target/.*",
					"venv/.*",
					".venv/.*",
					"__pycache__/.*",
					"vendor/.*",
				},
			},
			pickers = {
				live_grep = {
					additional_args = function()
						return {
							-- Para live_grep (evita que ripgrep escanee)
							"--glob",
							"!**/node_modules/*",
							"--glob",
							"!**/dist/*",
							"--glob",
							"!**/build/*",
							"--glob",
							"!**/target/*",
							"--glob",
							"!**/venv/*",
							"--glob",
							"!**/.venv/*",
							"--glob",
							"!**/__pycache__/*",
							"--glob",
							"!**/vendor/*",
						}
					end,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		-- Cargr extensiones de Telescope
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("ui-select")
	end,
}
