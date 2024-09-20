local languages = {
	"lua",
	"luadoc",
	"c",
	"cpp",
	"query",
	"typescript",
	"python",
	"rust",
	"javascript",
	"go"
}

return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/playground",
	},
	build = ":TSUpdate",
	event = "VeryLazy",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = languages,
		rainbow = {
			enable = true,
			extended_mode = true,
			colors = {
				"#FF0000", -- Rojo
				"#FF7F00", -- Naranja
				"#FFFF00", -- Amarillo
				"#7FFF00", -- Verde
				"#00FF00", -- Verde brillante
				"#00FFFF", -- Cian
				"#0000FF", -- Azul
				"#8A2BE2", -- Violeta
			},
			termcolors = { "Red",
				"Yellow",
				"Green",
				"Cyan",
				"Blue",
				"Magenta",
				"Gray",
			}
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25,
			persist_queries = false,
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			Vshow_help = '?',
		},
	}
}
