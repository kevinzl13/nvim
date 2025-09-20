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
vim.keymap.set("v", "y", '"+y"<CR>', opts) -- copy to system clipboard

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
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], opts)

-- ====================================
-- ToggleTerm
-- ====================================
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- Activar hints automáticamente con retardo para Pyright
		if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
			vim.defer_fn(function()
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end, 100)
		end

		-- Toggle de inlay hints
		vim.keymap.set("n", "<leader>uh", function()
			local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
			vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
		end, { buffer = bufnr, desc = "Toggle Inlay Hints" })
	end,
})
