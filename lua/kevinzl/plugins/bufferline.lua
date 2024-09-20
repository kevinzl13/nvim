return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		"famiu/bufdelete.nvim",
	},
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = {
					bufferline.style_preset.no_italic,
				},
				offsets = {
					{
						filetype = "NvimTree", -- Ajusta el espacio para el NvimTree
						text = "File Explorer", -- Texto que aparece en el espacio
						padding = 1, -- Relleno alrededor del texto
					},
				},
				close_command = function(bufnr)
					-- Usa :Bdelete en lugar de :bd
					require('bufdelete').bufdelete(bufnr, true)
				end,
				mode = "buffers"
			}
		})
	end,
}
