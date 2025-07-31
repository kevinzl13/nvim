return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/playground",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		local base_languages = {
			"vim",
			"vimdoc",
			"lua",
			"python",
			"c",
			"cpp",
			"javascript",
			"typescript",
			"json",
			"bash",
			"rust",
			"go",
			"markdown",
			"yaml",
			"toml",
			"html",
			"css",
		}

		configs.setup({
			ensure_installed = base_languages,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true, additional_vim_regex_highlighting = false },
			incremental_selection = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						["ca"] = "@conditional.outer",
						["ci"] = "@conditional.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
					},
				},
			},
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
				termcolors = {
					"Red",
					"Yellow",
					"Green",
					"Cyan",
					"Blue",
					"Magenta",
					"Gray",
				},
			},
			playground = {
				enable = true,
				disable = {},
				updatetime = 25,
				persist_queries = false,
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
			auto_install = true,
			parser_install_dir = nil,
			compiler = { "clang", "gcc" },
		})
	end,
}
