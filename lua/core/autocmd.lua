-- 🔔 Mostrar notificación por cliente LSP
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client.server_capabilities.completionProvider then
			print("LSP completions enabled for " .. client.name)
		end
	end,
})

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
