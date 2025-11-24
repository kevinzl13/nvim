return {
	"saghen/blink.cmp",
	dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
	version = "1.*",
	opts = {
		keymap = {
			preset = "enter",
			["<C-a>"] = {
				function(cmp)
					if cmp.is_visible() then
						cmp.hide()
					else
						cmp.show()
					end
				end,
			},
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-n>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			["<C-u>"] = { "scroll_signature_up", "fallback" },
			["<C-d>"] = { "scroll_signature_down", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = true },
			signature = { enabled = true },
			trigger = {
				show_on_keyword = true,
				show_on_trigger_character = true,
				show_on_insert_on_trigger_character = true,
				show_on_accept_on_trigger_character = true,
			},
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},
			ghost_text = { enabled = true },
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = {
			implementation = "lua",
		},
	},
	opts_extend = { "sources.default" },
}
