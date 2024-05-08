vim.g.snippets = "luasnip"

local opt = vim.o

-- Configurar números de línea relativos para saltar
opt.number = true
opt.relativenumber = true


-- Configurar el estado de la última línea para siempre mostrarlo
opt.laststatus = 2

-- Activar la búsqueda resaltada
opt.hlsearch = true

-- Activar la búsqueda incremental
opt.incsearch = true

-- Hacer que la búsqueda sea inteligente (sensible a mayúsculas/minúsculas si se incluyen mayúsculas)
opt.smartcase = true

-- Activar la indentación automática
opt.autoindent = true

-- Expandir tabulaciones en espacios
opt.expandtab = false
opt.noexpandtab = true

-- Establecer el ancho de la tabulación a 4 espacios
opt.shiftwidth = 4

-- al presionar la tecla Tab se insertarán 4 espacios
opt.tabstop = 4

-- Establecer el ancho de parada suave a 4 espacios
opt.softtabstop = 4

-- Habilitar la indentación de acuerdo al tipo de archivo
opt.filetype_indent = true

-- Desactivar todas las advertencias de la campana
opt.belloff = 'all'

opt.splitbelow = true
opt.splitrigth = true

-- background
-- opt.background = 'dark'
