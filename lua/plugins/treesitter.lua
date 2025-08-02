return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "VeryLazy", "BufReadPre" },
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
						["ic"] = "@class.inner",
						["as"] = "@local.scope",
						["ca"] = "@conditional.outer",
						["ci"] = "@conditional.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
					},
				},
			},
			auto_install = true,
			parser_install_dir = nil,
			compiler = { "clang", "gcc" },
		})
	end,
}
