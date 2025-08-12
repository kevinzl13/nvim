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

		-- Cargar highlights personalizados
		local highlights = require("config.highlights")
		highlights.setup_cmp_highlights()

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
            preselect = cmp.PreselectMode.Item,
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<TAB>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.choice_active() then
						luasnip.change_choice(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-TAB>"] = cmp.mapping.select_prev_item(),

				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if cmp.get_selected_entry() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
						else
							fallback()
						end
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-a>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.abort()
					else
						cmp.complete()
					end
				end, { "i", "s" }),

				["<C-j>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item({ count = 4, behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-k>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item({ count = 4, behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-t>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.scroll_docs(-4)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-g>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.scroll_docs(4)
					else
						fallback()
					end
				end, { "i", "s" }),
			},
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
						local icon = lspkind.symbol_map[vim_item.kind] or ""
						vim_item.kind = string.format("%s %s", icon, vim_item.kind)
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
			experimental = {
				ghost_text = true,
			},
			completion = {
				completeopt = "menu,menuone,noselect",
                keyword_length = 1, -- por defecto 2
                debounce = 75, -- en ms, por defecto suele ser 100-200
			},
		})

		-- Integración con autopairs
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Cmdline para `/` y `:`
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		-- Íconos personalizados
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

