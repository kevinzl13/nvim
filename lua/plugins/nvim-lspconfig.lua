return {
    "neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
	},
    config = function()
        require("config.lspconfig")
        local lspconfig = require('lspconfig')
        lspconfig['lua_ls'].setup({ capabilities = capabilities })
    end
}
