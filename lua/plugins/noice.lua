return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			routes = {
				{
					filter = { event = "msg_show", kind = "search_count" },
					opts = { skip = true }, -- No mostrar en la historia
					view = "virtualtext",
				},
			},
			status = {},
			format = {},
			debug = false, -- Modo debug desactivado
			log = {
				enabled = false, -- Logging desactivado
				level = "warn", -- Nivel de logging (opcional)
				max_size = 10000, -- Tamaño máximo del log en KB
			},

			log_max_size = {},

			cmdline = {
				enabled = true,
				view = "cmdline_popup", -- Vista moderna para la línea de comandos
				opts = {}, -- Opciones adicionales
			},
			redirect = {
				view = "popup", -- Para mensajes redirigidos (ej. :!ls)
			},
			commands = {
				history = {
					view = "split", -- Vista para el historial de mensajes
				},
				search = {
					view = "virtualtext", -- Vista para búsquedas
				},
			},
			markdown = {
				hover = {
					["|(%S-)|"] = function(link)
						vim.cmd.help(link)
					end, -- Resalta |texto| como ayuda
				},
				highlights = {
					["|%S-|"] = { link = "HelpHyperTextEntry" }, -- Estilo para enlaces
				},
			},
			health = {
				checker = true, -- Verifica dependencias al iniciar
			},
			throttle = 1000 / 30, -- 30 FPS para mejor rendimiento

			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				hover = {
					enabled = true,
					view = nil, -- Usa la vista por defecto
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
			messages = {
				enabled = true,
				view = "notify",
				view_error = "notify",
				view_warn = "notify",
				view_history = "messages",
				view_search = "virtualtext",
			},
			notify = {
				enabled = true,
				view = "notify",
			},
			popupmenu = {
				enabled = true,
				backend = "nui",
			},
			views = { -- Define vistas personalizadas
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
				popup = {
					border = {
						style = "rounded",
					},
				},
			},
		})
	end,
}
