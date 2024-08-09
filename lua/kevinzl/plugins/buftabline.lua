return {
	"jose-elias-alvarez/buftabline.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons"
	},
	opts = {
		icon_colors = true,
		flags = {
			modified = " [+]",
			not_modifiable = " [-]",
			readonly = " [RO]",
		},
		tab_format = " #{n}: #{b}#{f} #{i} ",
		hlgroups = {
			current = "TabLineSel",
			normal = "TabLine",
			active = nil,
			spacing = nil,
			modified_current = nil,
			modified_normal = nil,
			modified_active = nil,
			tabpage_current = nil,
			tabpage_normal = nil,
		},
		show_tabpages = true,
		tabpage_format = " #{n} ",
		tabpage_position = "right",
	}
}
