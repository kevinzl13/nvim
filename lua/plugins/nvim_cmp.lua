return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"neovim/nvim-lspconfig",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"windwp/nvim-autopairs",
		"onsails/lspkind.nvim",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		-- Carga configuración base
		require("plugins.configs.nvim-cmp")

		local cmp = require("cmp")
		local lspkind = require("lspkind")

		-- Cargar los highlights personalizados
		local highlights = require("plugins.configs.highlights")
		highlights.setup_cmp_highlights()

		-- Integración con autopairs
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Configuración de lspkind (íconos)
		lspkind.init({
			symbol_map = {
				Text = "",
				Method = "",
				Function = "󰊕",
				Constructor = "",
				Field = "",
				Variable = "󰀫",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			},
		})
	end,
}
