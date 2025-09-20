return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
	},
	opts = {
		inlay_hints = { enabled = true },
	},
	config = function()
		require("config.lspconfig")
	end,
}
