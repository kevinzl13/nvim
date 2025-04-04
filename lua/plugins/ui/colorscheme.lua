vim.o.termguicolors = true
vim.cmd("set background=dark")

return {
	"vague2k/vague.nvim",
	lazy = false, -- Cargar inmediatamente
	priority = 1000,
	config = function()
		-- Configuración del tema Vague
		require("vague").setup({
			transparent = false, -- No establecer fondo transparente
			style = {
				boolean = "none",
				number = "none",
				float = "none",
				error = "bold", -- Resaltar errores con negrita e itálico
				comments = "italic", -- Comentarios en itálico
				conditionals = "none",
				functions = "bold", -- Funciones en negrita
				headings = "bold",
				operators = "none",
				strings = "none",
				variables = "none",
				keywords = "none",
				keyword_return = "none",
				keywords_loop = "none",
				keywords_label = "none",
				keywords_exception = "none",
				builtin_constants = "none",
				builtin_functions = "none",
				builtin_types = "none",
				builtin_variables = "none",
			},
			colors = {
				bg = "#18191a", -- Fondo oscuro
				fg = "#cdcdcd", -- Texto general (gris claro)
				floatBorder = "#878787", -- Borde de ventanas flotantes
				line = "#282830", -- Línea de fondo
				comment = "#646477", -- Comentarios (gris claro)
				builtin = "#bad1ce", -- Constantes y funciones incorporadas
				func = "#be8c8c", -- Funciones (morado claro)
				string = "#deb896", -- Cadenas de texto (naranja)
				number = "#d2a374", -- Números (dorado claro)
				property = "#c7c7d4", -- Propiedades (gris claro)
				constant = "#b4b4ce", -- Constantes (gris)
				parameter = "#b9a3ba", -- Parámetros (lila suave)
				visual = "#363738", -- Selección visual (gris oscuro)
				error = "#ff5f5f", -- Errores (rojo intenso)
				warning = "#e6be8c", -- Advertencias (amarillo)
				hint = "#8ca0dc", -- Pistas (azul claro)
				operator = "#96a3b2", -- Operadores (gris claro)
				keyword = "#7894ab", -- Palabras clave (azul grisáceo)
				type = "#a1b3b9", -- Tipos (gris azul)
				search = "#465362", -- Búsquedas (gris oscuro)
				plus = "#8faf77", -- Añadir (verde)
				delta = "#e6be8c", -- Delta (amarillo)
			},
		})
		-- Establecer el esquema de colores
		vim.cmd.colorscheme("vague")
	end,
}
