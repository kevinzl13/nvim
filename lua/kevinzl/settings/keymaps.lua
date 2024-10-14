local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')
local ls = require("luasnip")

-- NvimTree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, opts)

-- Terminal

vim.api.nvim_set_keymap("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tf", ":ToggleTerm direction=float<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", opts)
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]],  opts)
vim.api.nvim_set_keymap('t', '<C-q>', [[<C-\><C-n>]],  opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<A-w>", ":Bdelete<CR>", opts)
-- vim.keymap.set('n', '<S-b>', ':buffers<CR>', opts)

-- Source
vim.keymap.set('n', '<F12>', ':source %<CR>', opts)

-- Moverse en Vim
-- Modo insertar
vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-s>', '<Cmd>w<CR>', opts)
vim.keymap.set('i', '<C-j>', '<Down>', opts)
vim.keymap.set('i', '<C-k>', '<Up>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)
vim.keymap.set('i', '<C-q>', '<Esc>', opts)
vim.keymap.set({ "i", "s" }, "<C-A-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-A-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })


-- Modo visual
vim.keymap.set('v', 'y', '"+y', opts)

-- Modo normal
-- Funciones guardar, salir, etc.
vim.keymap.set('n', '<C-q>', ':q<Esc>', opts)
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)
vim.keymap.set('n', '//', ':noh<return><esc>', opts)

-- Ventanas o splits
vim.keymap.set("n", "<leader>V", ":vsplit<CR>", opts)
vim.keymap.set('n', "<leader>H", ":split<CR>", opts)
vim.keymap.set('n', '<A-h>', '<C-w>h', opts)
vim.keymap.set('n', '<A-j>', '<C-w>j', opts)
vim.keymap.set('n', '<A-k>', '<C-w>k', opts)
vim.keymap.set('n', '<A-l>', '<C-w>l', opts)

-- Identación
-- Mover líneas de código
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", opts)
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", opts)

-- Indentar
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<CR>', ':<C-u>normal! gv<CR><Esc>', opts) -- despues de indentar con Enter se quita modo visual aplicando la indentacion

-- Mapeos de teclado para Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Función personalizada para buscar archivos de plugins
vim.keymap.set(
    'n',
    '<leader>rp',
    function()
        require("telescope.builtin").find_files({
            prompt_title = "Plugins",
            cwd = vim.fn.stdpath("config") .. "/lua/kevinzl/plugins",
            attach_mappings = function(_, map)
                local actions = require("telescope.actions")
                local action_state = require("telescope.actions.state")
                map("i", "<c-y>", function(prompt_bufnr)
                    local new_plugin = action_state.get_current_line()
                    actions.close(prompt_bufnr)
                    vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
                end)
                return true
            end
        })
    end,
    {}
)
