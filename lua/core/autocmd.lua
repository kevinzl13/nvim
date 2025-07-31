vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			vim.notify("Servidor LSP '" .. client.name .. "' listo", vim.log.levels.INFO)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		-- Quita opciones para que no siga el comentario automáticamente
		vim.opt.formatoptions:remove({ "c", "r", "o" })
		-- Asegura que 'autoindent' esté activo para mantener la indentación
		vim.opt.autoindent = true
	end,
})
