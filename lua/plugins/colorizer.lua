-- return {
-- 	"brenoprata10/nvim-highlight-colors",
-- 	config = function()
-- 		require("nvim-highlight-colors").setup({
-- 			render = "background",
-- 			---Highlight hex colors, e.g. '#FFFFFF'
-- 			enable_hex = true,
--
-- 			---Highlight short hex colors e.g. '#fff'
-- 			enable_short_hex = true,
--
-- 			---Highlight rgb colors, e.g. 'rgb(0 0 0)'
-- 			enable_rgb = true,
--
-- 			---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
-- 			enable_hsl = true,
--
-- 			---Highlight ansi colors, e.g '\033[0;34m'
-- 			enable_ansi = true,
--
-- 			---Highlight xterm 256 (8bit) colors, e.g '\033[38;5;118m'
-- 			enable_xterm256 = true,
--
-- 			---Highlight xterm True Color (24bit) colors, e.g '\033[38;2;118;64;90m'
-- 			enable_xtermTrueColor = true,
--
-- 			-- Highlight hsl colors without function, e.g. '--foreground: 0 69% 69%;'
-- 			enable_hsl_without_function = true,
--
-- 			---Highlight CSS variables, e.g. 'var(--testing-color)'
-- 			enable_var_usage = true,
--
-- 			---Highlight named colors, e.g. 'green'
-- 			enable_named_colors = true,
--
-- 			---Highlight tailwind colors, e.g. 'bg-blue-500'
-- 			enable_tailwind = true,
-- 		})
-- 	end,
-- }

return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",

	config = function()
		require("colorizer").setup({
			filetypes = { "*" },
			buftypes = {},
			user_commands = true,
			lazy_load = false,

			options = {
				parsers = {
					css = true,
					css_fn = true,

					names = {
						enable = true,
						lowercase = true,
						camelcase = true,
						uppercase = true,
						strip_digits = false,
						custom = false,
						extra_word_chars = "-",
					},

					hex = {
						default = true,
						rgb = true,
						rgba = true,
						rrggbb = true,
						rrggbbaa = true,
						hash_aarrggbb = true,
						aarrggbb = true,
						no_hash = true,
					},

					rgb = {
						enable = true,
					},

					hsl = {
						enable = true,
					},

					oklch = {
						enable = true,
					},

					hwb = {
						enable = true,
					},

					lab = {
						enable = true,
					},

					lch = {
						enable = true,
					},

					css_color = {
						enable = true,
					},

					tailwind = {
						enable = true,
						update_names = true,

						lsp = {
							enable = true,
							disable_document_color = true,
						},
					},

					sass = {
						enable = true,

						parsers = {
							css = true,
						},

						variable_pattern = "^%$([%w_-]+)",
					},

					xterm = {
						enable = true,
					},

					ls_colors = {
						enable = true,
					},

					xcolor = {
						enable = true,
					},

					hsluv = {
						enable = true,
					},

					css_var_rgb = {
						enable = true,
					},

					css_var = {
						enable = true,

						parsers = {
							css = true,
						},
					},

					custom = {},
				},

				display = {
					-- background
					-- foreground
					-- underline
					-- virtualtext

					mode = "background",

					virtualtext = {
						char = "■",
						position = "before",
						hl_mode = "foreground",
					},

					priority = {
						default = 150,
						lsp = 200,
					},

					disable_document_color = true,
				},

				hooks = {
					should_highlight_line = false,
					should_highlight_color = false,
					transform_color = false,
					on_attach = false,
					on_detach = false,
				},

				always_update = false,
				debounce_ms = 0,
			},
		})
	end,
}
