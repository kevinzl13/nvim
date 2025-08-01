local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	completion = {
		completeopt = "menu,menuone,preview,noselect",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
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
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	}),

	formatting = {
		fields = { "kind", "abbr", "menu" },
		expandable_indicator = true,
		format = lspkind.cmp_format({
			mode = "symbol_text",
			preset = "default",
			menu = {
				nvim_lsp = "[LSP]",
				luasnip = "[Snip]",
				buffer = "[Buffer]",
				path = "[Path]",
			},
			before = function(entry, vim_item)
				vim_item.kind = string.format("%s %s", lspkind.symbolic(vim_item.kind) or "", vim_item.kind)
				return vim_item
			end,
		}),
	},
})
