-- 🔔 Mostrar notificación solo una vez por cliente LSP (excluye null-ls)
local notified_clients = {}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name ~= "null-ls" and not notified_clients[client.id] then
			vim.notify("󰒕 Servidor LSP '" .. client.name .. "' listo", vim.log.levels.INFO, {
				title = "LSP",
			})
			notified_clients[client.id] = true
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
