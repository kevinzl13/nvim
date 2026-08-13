return {
	"windwp/nvim-ts-autotag",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true, -- Auto-cerrar al escribir >
				enable_rename = true, -- Auto-renombrar al editar
				enable_close_on_slash = false, -- No autocompletar al escribir </ (recomendado)
			},
		})
	end,
}
