return {
	"navarasu/onedark.nvim",
	priority = 1000,

	config = function()
		require("onedark").setup({
			style = "deep",
			transparent = false,
			term_colors = true,

			code_style = {
				comments = "italic",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none",
			},

			lualine = {
				transparent = false,
			},

			diagnostics = {
				darker = true,
				undercurl = true,
				background = true,
			},
		})
	end,
}
