return {
	-- primero cargo install or b install tree-sitter-cli
	-- tree-sitter --version
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"neovim-treesitter/treesitter-parser-registry",
	},

	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({
			sync_install = false,
			auto_install = true,
		})

		ts.install({
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
			"cmake",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"vim",
				"lua",
				"python",
				"c",
				"cpp",
				"javascript",
				"typescript",
				"json",
				"sh",
				"rust",
				"go",
				"markdown",
				"yaml",
				"toml",
				"html",
				"css",
				"cmake",
			},
			callback = function()
				vim.treesitter.start()
			end,
		})

		require("nvim-treesitter-textobjects").setup({
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
		})
	end,
}
