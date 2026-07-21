local M = {}

function M.select()
	local themes = vim.fn.getcompletion("", "color")

	vim.ui.select(themes, {
		prompt = "󰏘 Seleccionar tema:",
	}, function(choice)
		if choice then
			vim.cmd.colorscheme(choice)
			vim.notify("Tema: " .. choice)
		end
	end)
end

vim.keymap.set("n", "<leader>ts", function()
	M.select()
end, {
	desc = "Cambiar tema",
})

return M
