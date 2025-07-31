-- Leader
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- Mappings

-- nvimtree

vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
vim.keymap.set("n", "<A-w>", ":Bdelete<CR>")

-- Copy/Search
vim.keymap.set("v", "y", '"+y"')
vim.keymap.set("n", "//", ":nohlsearch<esc>")

-- insert mode
vim.keymap.set("i", "<C-s>", "<Cmd>w<CR>")
vim.keymap.set("i", "<C-q>", "<Esc>")

--normal mode
vim.keymap.set("n", "<C-q>", ":q<Esc>")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<leader>o", "o<Esc>k")

-- Indentacion
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv'")
vim.keymap.set("x", "J", ":move '>-+1<CR>gv-gv'")
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", "<CR>", [[:normal! gv<CR><Esc>]], opts)

-- Term
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=horizontal")
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float")
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]])

-- inlay hints
vim.keymap.set("n", "<leader>uh", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
	vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
end, { desc = "Toggle Inlay Hints" })
