--mapleader
vim.g.mapleader = " "

--Mappings
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>ee", vim.cmd.NvimTreeClose)
vim.keymap.set("n","<leader>1", vim.cmd.bfirst)
vim.keymap.set("n","<leader>0", vim.cmd.blast)
vim.keymap.set("n","<Tab>", vim.cmd.bnext)
vim.keymap.set("n","<S-Tab>", vim.cmd.bprevious)


-- source
vim.api.nvim_set_keymap('n', '<F12>', ':source %<CR>', { noremap = true })

-- moverse en vim
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })


-- funciones guardar,salir,etc
vim.api.nvim_set_keymap('i', '<A-q>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-e>', ':wq<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-x>', ':q!<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', '//', ':noh<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:w<CR>', {noremap = true})

-- Pestañas
vim.api.nvim_set_keymap('n', '<A-d>', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-e>', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-w>', ':tabprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-r>', ':tabclose<CR>', { noremap = true })

-- Buffers abiertos
vim.api.nvim_set_keymap('n', '<S-e>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-q>', ':bprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-w>', ':bdelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-b>', ':buffers<CR>', { noremap = true })

-- Ventanas
vim.api.nvim_set_keymap('n', '<S-v>', ':vnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-n>', ':new<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-r>', ':quit<CR>', { noremap = true })

