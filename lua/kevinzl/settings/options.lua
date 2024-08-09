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
opt.smartindent = true

-- Expandir tabulaciones en espacios
opt.expandtab = false

-- Establecer el ancho de la tabulación a 4 espacios
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.wrap = true
opt.linebreak = true


--
opt.backup = false
opt.errorbells = false
opt.swapfile =false
opt.signcolumn = 'yes'

-- Habilitar soporte para colores de 24 bits
opt.termguicolors = true


vim.cmd('filetype on')
-- -- Activar la sintaxis resaltada
vim.cmd('syntax on')

