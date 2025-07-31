return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost", "InsertLeave" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			lua = { "selene" },
			python = { "flake8" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			cpp = { "cpplint" },
			c = { "cpplint" },
			json = { "jsonlint" },
			go = { "golangci-lint" },
		}

		-- Opcional: trigger automático del linter al guardar
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
		vim.diagnostic.config({
			virtual_text = true, -- Muestra el error en la línea
			signs = true, -- Muestra íconos en la columna izquierda
			underline = true, -- Subraya el error en el código
			update_in_insert = false, -- No molestar mientras escribes
		})
	end,
}
