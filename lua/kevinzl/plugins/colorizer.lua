return {
	"brenoprata10/nvim-highlight-colors",
	event = 'BufWinEnter',
	config = function()
		require('nvim-highlight-colors').setup({
			enable_hex = true, -- Destacar colores hexadecimales, e.g. '#FFFFFF'
			enable_short_hex = true, -- Destacar colores hexadecimales cortos, e.g. '#fff'
			enable_rgb = true, -- Destacar colores rgb, e.g. 'rgb(0 0 0)'
			enable_hsl = true, -- Destacar colores hsl, e.g. 'hsl(150deg 30% 40%)'
			enable_var_usage = true, -- Destacar variables CSS, e.g. 'var(--testing-color)'
			enable_named_colors = true, -- Destacar colores nombrados, e.g. 'green'
			enable_tailwind = true,
		})
	end,
}
