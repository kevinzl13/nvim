return {
	{
		'rust-lang/rust.vim',
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end
	},
	{
		'simrat39/rust-tools.nvim',
		ft = "rust",
		opts = {
			server = {
				on_attach = require("kevinzl.plugins.lsp").on_attach,
				capabilities = require("kevinzl.plugins.settings.capabilities").capabilities
			},
		},
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end

	}
}
