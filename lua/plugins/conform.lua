return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "autopep8" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
				go = { "gofumpt" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = true,
			},
			formatters = {
				prettier = {
					inherit = true,
					prepend_args = { "--tab-width", "4", "--use-tabs", "true" },
				},
				stylua = {
					inherit = true,
					prepend_args = { "--indent-type", "Tabs", "--indent-width", "4" },
				},
				clang_format = {
					inherit = true,
					prepend_args = { "--style={UseTab: ForIndentation, TabWidth: 4, IndentWidth: 4}" },
				},
				rustfmt = {
					inherit = true,
					prepend_args = { "--config", "hard_tabs=true", "--config", "tab_spaces=4" },
				},
				gofumpt = {
					inherit = true,
					prepend_args = { "--tabs=true", "--tabwidth=4" },
				}, -- gofmt/gofumpt usa tabs por defecto, no necesita config extra
				autopep8 = {
					-- autopep8 no soporta tabs: fuerza 4 espacios por defecto (sin opción para tabs)
					inherit = true,
					prepend_args = { "--indent-size=4" },
				},
			},

			setup = function()
				vim.keymap.set({ "n", "v", "i" }, "<A-S-f>", function()
					conform.format({
						async = false,
						timeout_ms = 1500,
						lsp_fallback = true,
					})
				end, { desc = "Format file" })
			end,
		})
	end,
}

