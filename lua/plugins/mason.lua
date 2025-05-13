return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- Integración Mason + LSP
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			after = { "mason.nvim", "mason-lspconfig.nvim" },
		},
	},
	config = function()
		local servers = require("core.servers.lsp_servers")

		-- Configurar Mason
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Instalar LSPs automáticamente
		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = servers.lsp,
		})

		-- Instalar herramientas (formatters, linters) automáticamente
		require("mason-tool-installer").setup({
			ensure_installed = servers.tools,
		})
	end,
}
