-- Leader key
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- ====================================
-- General Mappings
-- ====================================

-- Normal Mode
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("n", "<C-q>", ":q<CR>", opts)
vim.keymap.set("n", "<leader>o", "o<Esc>k", opts)

-- Insert Mode
vim.keymap.set("i", "<C-s>", "<Cmd>w<CR>", opts)
vim.keymap.set("i", "<C-q>", "<Esc>", opts)

-- Visual Mode
vim.keymap.set("v", "y", '"+y"', opts) -- copy to system clipboard

-- Disable search highlight
vim.keymap.set("n", "//", ":nohlsearch<CR>", opts)

-- Buffer Navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<A-w>", ":Bdelete<CR>", opts)

-- ====================================
-- Visual Mode – Line Movement and Indentation
-- ====================================
vim.keymap.set("x", "K", ":<C-u>move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "J", ":<C-u>move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", ">", ">gv", opts)
vim.keymap.set("x", "<", "<gv", opts)
vim.keymap.set("x", "<CR>", ":<C-u>normal! gv<CR><Esc>", opts)

-- ====================================
-- NvimTree
-- ====================================
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- ====================================
-- ToggleTerm
-- ====================================
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=horizontal<CR>", opts)
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", opts)
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", opts)

-- ToggleTerm
-- ===de Escaping
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], opts)

-- Mapeos Copilot con vim.keymap.set
vim.keymap.set("i", "<A-j>", function()
	return vim.fn["copilot#Accept"]("<CR>")
end, { expr = true, replace_keycodes = false, desc = " Copilot Accept" })

vim.keymap.set("i", "<A-e>", function()
	return vim.fn["copilot#Dismiss"]()
end, { expr = true, desc = " Copilot Dismiss" })

vim.keymap.set("i", "<A-s>", function()
	return vim.fn["copilot#Suggest"]()
end, { expr = true, desc = " Copilot Suggest" })

vim.keymap.set("i", "<A-n>", function()
	return vim.fn["copilot#Next"]()
end, { expr = true, desc = " Copilot Next Suggestion" })

vim.keymap.set("i", "<A-S-n>", function()
	return vim.fn["copilot#Previous"]()
end, { expr = true, desc = " Copilot Previous Suggestion" })

vim.keymap.set("n", "<leader>cc", function()
	if vim.g.copilot_enabled then
		vim.cmd("Copilot disable")
		vim.g.copilot_enabled = false
		print(" Copilot desactivado")
	else
		vim.cmd("Copilot enable")
		vim.g.copilot_enabled = true
		print(" Copilot activado")
	end
end, { desc = " Toggle Copilot" })
