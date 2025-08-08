-- 🛠️ Ajustes de formato al abrir cualquier tipo de archivo
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		-- Evita que los comentarios se inserten automáticamente en nuevas líneas
		vim.opt.formatoptions:remove({ "c", "r", "o" })
		-- Mantiene indentación automática
		vim.opt.autoindent = true
	end,
})

