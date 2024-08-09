local opts = { noremap = true, silent = true }


--NvimTree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>ee", vim.cmd.NvimTreeClose)
-- Buffers
vim.keymap.set("n","<leader>1", vim.cmd.bfirst)
vim.keymap.set("n","<leader>0", vim.cmd.blast)
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<S-w>", ":Bdelete<CR>", opts)
-- source
vim.api.nvim_set_keymap('n', '<F12>', ':source %<CR>', opts)


-- moverse en vim
-- Modo insertar
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', opts)
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', opts)
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', opts)
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', opts)
-- modo visual
vim.api.nvim_set_keymap('v', 'y', '"+y', opts)
--modo normal
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", opts)
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", opts)

---- funciones guardar,salir,etc
-- Poner en modo normal en vim y salir de vim
vim.api.nvim_set_keymap('i', '<C-q>', '<Esc>', opts)
vim.api.nvim_set_keymap('n', '<C-q>', ':q<Esc>', opts)
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-x>', ':q!<CR>', opts)
vim.api.nvim_set_keymap('n', '//', ':noh<return><esc>', opts)
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:w<CR>', opts)


-- Buffers abiertos
vim.api.nvim_set_keymap('n', '<S-e>', ':bnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-q>', ':bprev<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-b>', ':buffers<CR>', opts)

-- Ventanas o splits
vim.api.nvim_set_keymap("n", "<leader>V",":vsplit<CR>",opts)
vim.api.nvim_set_keymap('n', "<leader>H", ":split<CR>",opts)
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', opts)


-- Identacion
-- Mover lineas de codigo
vim.api.nvim_set_keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)

-- Identar
vim.api.nvim_set_keymap('v', '<', '<gv', opts)
vim.api.nvim_set_keymap('v', '>', '>gv', opts)


