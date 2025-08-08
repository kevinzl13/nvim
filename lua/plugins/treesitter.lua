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

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
    build = ":TSUpdate",
    opts = {
        ensure_installed = base_languages,
        sync_install = false,
        highlight = {
              enable = true,
              additional_vim_regex_highlighting = false, -- o true si necesitas que convivan
        },
        indent = { enable = true },
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
    }
}


