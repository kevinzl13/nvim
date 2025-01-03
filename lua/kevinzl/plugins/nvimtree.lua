return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Iconos para archivos y carpetas
	},
	config = function()
		require("nvim-tree").setup({
			-- Configuración de orden
			sort_by = "case_sensitive", -- Ordenar respetando mayúsculas/minúsculas

			-- Configuración de la vista
			view = {
				adaptive_size = false, -- No ajustar automáticamente el tamaño del árbol
				side = "left", -- Mostrar el árbol a la derecha
				width = 30, -- Ancho fijo del árbol
				preserve_window_proportions = true, -- Mantener proporciones al dividir ventanas
			},

			-- Filtros
			filters = {
				dotfiles = false, -- Mostrar archivos ocultos (cambiable a true si no los quieres ver)
			},

			-- Opciones de Git
			git = {
				enable = true, -- Habilitar iconos de Git
				ignore = true, -- Ignorar archivos listados en .gitignore
			},

			-- Renderizado e iconos
			renderer = {
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "󰈚", -- Icono por defecto
						symlink = "", -- Enlace simbólico
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
							symlink_open = "",
							arrow_open = "",
							arrow_closed = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
				highlight_git = true, -- Resaltar cambios de Git
				full_name = false, -- Mostrar nombres como ruta relativa
			},
		})
	end,
}
