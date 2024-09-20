return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls", "rust_analyzer","clangd","gopls",
				"ts_ls","pyright","cssls","html",
			},
			automatic_installation = true,
		})
	end

}
