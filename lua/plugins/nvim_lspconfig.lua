return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim", -- Gestor de servidores LSP
		"williamboman/mason-lspconfig.nvim", -- Integración de Mason con LSPconfig
		"famiu/bufdelete.nvim",
        "hrsh7th/nvim-cmp", -- Autocompletado
		"hrsh7th/cmp-nvim-lsp", -- Fuente de autocompletado para LSP
		"L3MON4D3/LuaSnip", -- Snippets
		"folke/neodev.nvim", -- Mejoras para el LSP de Lua
	},
	config = function()
        require("plugins.configs.lspconfig")

        local cmp = require("cmp") 
        local luasnip = require("luasnip")  -- Opcional, si usas luasnip

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- Integración con LuaSnip
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- Autocompletado desde LSP
				{ name = "luasnip" }, -- Snippets
				{ name = "buffer" }, -- Autocompletado desde el buffer actual
				{ name = "path" }, -- Autocompletado para rutas de archivos
			}),
		})
	end,
}
