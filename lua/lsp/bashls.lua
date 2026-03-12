vim.lsp.config("bashls", {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
	root_markers = { ".git" }, -- equivalente a root_dir
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command)",
		},
	},
})
