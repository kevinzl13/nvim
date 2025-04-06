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
	},
	event = "VeryLazy",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Cargar los highlights personalizados
		local highlights = require("core.highlights")
		highlights.setup_cmp_highlights()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = require("core.keymaps").cmp(cmp),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 900 },
			}, {
				{ name = "buffer", priority = 800 },
				{ name = "path", priority = 700 },
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				expandable_indicator = true,
				format = lspkind.cmp_format({
					mode = "symbol_text",
					preset = "default",
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[Snip]",
						path = "[Path]",
					},
					before = function(entry, vim_item)
						-- Colorización adicional basada en el tipo
						vim_item.kind = string.format("%s %s", lspkind.symbolic(vim_item.kind) or "", vim_item.kind)
						return vim_item
					end,
				}),
			},
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -3,
					side_padding = 1,
				},
				documentation = {
					winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
				},
			},
		})

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
