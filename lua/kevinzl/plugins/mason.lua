local languajes = {
	"gopls",
	"pyright",
	"rust-analyzer",
	"clangd",
	"lua-language-server",
	"typescript-language-server",
	"autopep8",
	"flake8",
	"cssls",
	"html",
	"emmet-ls",

}

return {
	'williamboman/mason.nvim',
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		ensure_installed = languajes,
		automatic_installation = true,
	},
	config = true,

}
