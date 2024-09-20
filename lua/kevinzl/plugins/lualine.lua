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
			lualine_a = { 'mode' },
			lualine_b = { 'branch' },
			lualine_c = {
				{
					'filename',
					path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
				}
			},
			lualine_x = {
				'filetype',
				{
					'progress',
					color = { gui = 'bold' },
				}
			},
			lualine_y = { 'encoding', 'fileformat' },
			lualine_z = { 'location' }
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{
					'filename',
					path = 1,
				}
			},
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {}
		},
		tabline = {},
		extensions = { 'fugitive' }
	},
}
