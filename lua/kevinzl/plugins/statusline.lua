local theme = "horizon"

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = theme,
			globalstatus = true,
			icons_enabled = true,
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
		},
		sections = {
			lualine_b = { { "branch", icon = "" }, "db_ui#statusline" },
			lualine_c = { { "filename", file_status = true, path = 1, } },
			lualine_x = {
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = { fg = "#ff9e64" },
				},
			},
		},
		lualine_y = { "filetype" },
		-- winbar = {
		-- win	lualine_c = { "filename" },
		-- win},
		-- inactive_winbar = {
		-- ina	lualine_c = { "filename" },
		-- ina},
	},
}
