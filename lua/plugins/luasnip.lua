return {
	"L3MON4D3/LuaSnip",
	tag = "v2.*",
	run = "make install_jsregexp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		-- cargar snippets friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- cargar snippets personalizados
		require("luasnip.loaders.from_vscode").load({
			paths = "./snippets",
			reload = false,
		})
	end,
}
