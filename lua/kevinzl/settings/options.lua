vim.cmd('filetype on')
vim.cmd('syntax on')

local function remove_trailing_whitespace()
    vim.cmd([[ %s/\s\+$//e ]]) -- Comando Vim para eliminar espacios en blanco al final de las líneas
end

-- Autocomando que se ejecuta antes de guardar cualquier archivo
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",                       -- Se aplica a todos los archivos
    callback = remove_trailing_whitespace, -- Llama a la función definida
})


local opt = vim.opt

-- Números de línea
opt.number = true
opt.relativenumber = true

-- Estado de la última línea
opt.laststatus = 2

-- Búsqueda
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true

-- Indentación
opt.autoindent = true
opt.smartindent = true

-- Tabulaciones
opt.expandtab = true
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
opt.signcolumn = 'yes'

-- Colores
opt.termguicolors = true

-- Portapapeles
opt.clipboard:append("unnamedplus")

--formato de linebreak
opt.wrap = true -- Habilita el ajuste de línea
opt.linebreak = true -- Habilita el ajuste de línea respetando las palabras
