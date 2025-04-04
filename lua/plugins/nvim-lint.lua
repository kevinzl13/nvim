return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost", "InsertLeave" },
	config = function()
		local lint = require("lint")

		lint.linters.golangcilint = {
			name = "golangcilint",
			cmd = "golangci-lint",
			stdin = false,
			args = { "run", "--out-format", "json" },
			stream = "stdout",
			ignore_exitcode = true,
			parser = function(output, bufnr)
				local diagnostics = {}
				local json_ok, decoded = pcall(vim.json.decode, output)

				if json_ok and decoded and decoded.Issues then
					for _, issue in ipairs(decoded.Issues) do
						table.insert(diagnostics, {
							bufnr = bufnr,
							lnum = issue.Pos.Line - 1,
							col = issue.Pos.Column - 1,
							severity = vim.diagnostic.severity.WARN,
							message = issue.Text,
							source = "golangci-lint",
						})
					end
				end

				return diagnostics
			end,
		}

		lint.linters_by_ft = {
			lua = { "luacheck" },
			python = { "flake8" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			cpp = { "cpplint" },
			c = { "cpplint" },
			json = { "jsonlint" },
			go = { "golangcilint" },
			yaml = { "yamllint" },
			markdown = { "markdownlint" },
		}

		-- Ejecutar linters automáticamente al guardar o salir de modo Insert
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
