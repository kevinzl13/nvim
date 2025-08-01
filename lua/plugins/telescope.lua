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
	opts = function()
		return require("plugins.configs.telescope")
	end,
	config = function()
		-- Cargar telescope.actions
		local actions = require("telescope.actions")

		-- Configuración de Telescope
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_next, -- Mover a la siguiente opción
						["<C-j>"] = actions.move_selection_previous, -- Mover a la opción anterior
						["<C-q>"] = actions.close, -- Cerrar Telescope
					},
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
