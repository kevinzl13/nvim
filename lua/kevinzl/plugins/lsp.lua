return {
	'neovim/nvim-lspconfig',
	dependencies = {
		"williamboman/mason.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
		vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

		local on_attach = function(_, bufnr)
			vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
			local opts = { buffer = bufnr, noremap = true, silent = true }
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set('n', '<space>wl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', '<space>f', function()
				vim.lsp.buf.format { async = true }
			end, opts)
		end

		-- configurar los servers

		require("neodev").setup({})
		local lspconfig = require('lspconfig')
		local util = require("lspconfig/util")
		local capabilities = require("kevinzl.plugins.settings.rust").capabilities

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					telemetry = { enable = false },
					workspace = { checkThridParty = false }
				}
			}
		})
		lspconfig.pyright.setup({
			on_attach = on_attach,
		})
		lspconfig.gopls.setup({
			on_attach = on_attach,
		})
		lspconfig.clangd.setup({
			on_attach = on_attach,
			filetypes = {
				"c", "cpp", "objc", "objcpp", "cuda", "proto"
			},
			root_dir = util.root_pattern(
				'.clangd',
				'.clang-tidy',
				'.clang-format',
				'compile_commands.json',
				'compile_flags.txt',
				'configure.ac',
				'.git'
			),
			single_file_support = true,
			capabilities = {
				offsetEncoding = { "utf-8" },
			},
		})
		lspconfig.tsserver.setup({
			on_attach = on_attach
		})
		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { 'rust' },
			root_dir = util.root_pattern("Cargo.toml"),
			settings = {
				['rust-analyzer'] = {
					cargo = {
						allFeatures = true,
					},
				},
			},

		})
	end
}
