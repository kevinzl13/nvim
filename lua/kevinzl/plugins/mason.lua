local languajes = {
	"gopls",
	"pyright",
	"rust-analyzer",
	"clangd",
	"lua-language-server",
	"typescript-language-server"
}

return {
	'williamboman/mason.nvim',
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		ensure_installed = languajes,
	},
	config = true,

}
