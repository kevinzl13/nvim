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
	"cmake",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		ensure_installed = base_languages,
		highlight = {
			enable = true,
		},
		-- indent = { enable = true },
		-- instala los parsers de forma secuencial (uno por uno)
		sync_install = true,
		-- no instales automáticamente al abrir un buffer
		auto_install = false,
		-- ignorar parsers concretos
		ignore_install = {},

		-- también desactiva en archivos grandes
		-- disable = function(lang, buf)
		-- 	local max_filesize = 100 * 1024 -- 100 KB
		-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		-- 	if ok and stats and stats.size > max_filesize then
		-- 		return true
		-- 	end
		-- end,

		-- evita ejecutar highlight clásico de Vim en paralelo
		additional_vim_regex_highlighting = false,
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
	},
}
