local opt = vim.opt

-- Números de línea
opt.number = true
opt.relativenumber = true

-- Estado de la última línea
opt.laststatus = 3

-- Búsqueda
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true

-- Indentación
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.smarttab = true

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
opt.backspace = "indent,eol,start"

-- Portapapeles
opt.clipboard:append("unnamedplus")

--formato de linebreak
opt.wrap = true -- Habilita el ajuste de línea
opt.linebreak = true -- Habilita el ajuste de línea respetando las palabras
