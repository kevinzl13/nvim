local opt = vim.opt

-- Números de línea
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- Estado de la última línea
opt.laststatus = 3

-- No compactar lineas
opt.foldenable = false

-- Búsqueda
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true

-- Indentación
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.expandtab = true
opt.copyindent = true
opt.preserveindent = true

-- Tabulaciones
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Ajustes de línea
opt.wrap = true
opt.linebreak = true

-- Opciones generales
opt.backup = false
opt.errorbells = false
opt.swapfile = false
opt.signcolumn = "yes"
opt.mouse = "a"
opt.backspace = { "start", "eol", "indent" }

-- Portapapeles
opt.clipboard = "unnamedplus"

--formato de linebreak
opt.wrap = true
opt.linebreak = true

-- Habilitar detección de tipo de archivo, indentación y plugins
vim.cmd("filetype plugin indent on")

-- Habilitar resaltado de sintaxis
opt.foldmethod = "syntax"
opt.foldlevelstart = 99

-- adicionales
opt.splitright = true -- Dividir ventanas a la derecha
opt.splitbelow = true -- Dividir ventanas abajo

opt.shadafile = "NONE"
