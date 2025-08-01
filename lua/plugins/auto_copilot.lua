return {
	"github/copilot.vim",
	enabled = true,
	config = function()
		-- Copilot inicia desactivado
		vim.g.copilot_enabled = false

		-- Opciones básicas
		vim.g.copilot_no_tab_map = true
		vim.g.copilot_assume_mapped = true
		vim.g.copilot_filetypes = {
			["*"] = true,
		}

		-- Silenciar "Copilot ready"
		local original_notify = vim.notify
		vim.notify = function(msg, level, opts)
			if type(msg) == "string" and msg:match("Copilot") and msg:match("ready") then
				return
			end
			original_notify(msg, level, opts)
		end
	end,
}
