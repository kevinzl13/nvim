return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim", -- Gestor de servidores LSP
		"williamboman/mason-lspconfig.nvim", -- Integración de Mason con LSPconfig
		"hrsh7th/nvim-cmp", -- Autocompletado
		"hrsh7th/cmp-nvim-lsp", -- Fuente de autocompletado para LSP
		"L3MON4D3/LuaSnip", -- Snippets
		"folke/neodev.nvim", -- Mejoras para el LSP de Lua
		"simrat39/rust-tools.nvim",
	},
	config = function()
		local servers = require("core.servers.lsp_servers")

		-- Configurar Mason
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = servers.lsp,
		})

		-- Configurar neodev.nvim (mejoras para el LSP de Lua)
		require("neodev").setup()

		-- Configurar capacidades mejoradas para LSP (integración con nvim-cmp)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Función on_attach para configurar los keymaps personalizados para LSP
		local on_attach = function(client, bufnr)
			local keymaps = require("core.keymaps")
			keymaps.lsp_keymaps(bufnr)
		end

		-- Configurar todos los LSPs automáticamente con Mason
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
		})

		-- Configurar nvim-cmp (autocompletado)
		local cmp = require("cmp")
		local keymaps = require("core.keymaps")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- Integración con LuaSnip
				end,
			},
			mapping = keymaps.cmp(cmp), -- Cargar los atajos de teclado para cmp
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- Autocompletado desde LSP
				{ name = "luasnip" }, -- Snippets
				{ name = "buffer" }, -- Autocompletado desde el buffer actual
				{ name = "path" }, -- Autocompletado para rutas de archivos
			}),
		})
	end,
}
