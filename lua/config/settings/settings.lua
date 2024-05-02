--Basic settings

-- Completado de parentesis
vim.api.nvim_set_keymap('i', '(', '()<Esc>i', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Esc>i', { noremap = true })
-- vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Esc>i', { noremap = true })
vim.api.nvim_set_keymap('i', '<', '<><Esc>i', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<Esc>i", { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<Esc>i', { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<Esc>i', { noremap = true })

vim.cmd('filetype on')
-- -- Activar la sintaxis resaltada
vim.cmd('syntax on')