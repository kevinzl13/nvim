-- LSP Setup
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

-- Autocmd group for LspAttach
local user_lsp_group = vim.api.nvim_create_augroup("UserLspConfig", {})

vim.api.nvim_create_autocmd("LspAttach", {
	group = user_lsp_group,
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		local opts = { buffer = ev.buf }

		-- Basic LSP keymaps
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set({ "i", "n" }, "<A-,>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		-- Luasnip navigation
		vim.keymap.set({ "i", "s" }, "<C-A-k>", function()
			local luasnip = require("luasnip")
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			end
		end, opts)

		vim.keymap.set({ "i", "s" }, "<C-A-j>", function()
			local luasnip = require("luasnip")
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, opts)

		-- Formatting
		vim.keymap.set({ "n", "i" }, "<A-S-f>", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, opts)

		-- Inlay hints
		if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
			vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
			vim.keymap.set("n", "<leader>uh", function()
				local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })
				vim.lsp.inlay_hint.enable(not enabled, { bufnr = ev.buf })
			end, opts)

			vim.api.nvim_set_hl(0, "LspInlayHint", {
				fg = "#7F7F7F",
				italic = true,
			})
		end
	end,
})

-- Lua
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			telemetry = { enable = false },
			workspace = { checkThirdParty = false },
			hint = { enable = true },
		},
	},
	filetypes = { "lua" },
	single_file_support = true,
	root_dir = util.root_pattern(
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git"
	),
})

-- Python
lspconfig.pyright.setup({
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
				},
			},
		},
	},
	filetypes = { "python" },
	single_file_support = true,
	root_dir = util.root_pattern("requirements.txt", "pyproject.toml", "setup.py", ".git"),
})

-- Go
lspconfig.gopls.setup({
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				unreachable = true,
			},
			staticcheck = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
})

-- Rust
lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
				loadOutDirsFromCheck = true,
				runBuildScripts = false,
				buildScripts = { enable = false },
			},
			checkOnSave = true,
			checkOnSaveCommand = "clippy",
			procMacro = { enable = false },
			files = { exclude = { "target/**" } },
			formatting = { enable = true },
			inlayHints = {
				enable = true,
				parameterHints = { enable = true },
				typeHints = { enable = true },
			},
		},
	},
	filetypes = { "rust" },
	root_dir = util.root_pattern("Cargo.toml", "rust-project.json", ".git"),
	single_file_support = true,
})

-- C/C++
lspconfig.clangd.setup({
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_dir = util.root_pattern(
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git"
	),
	single_file_support = true,
})

-- TypeScript/JavaScript
lspconfig.ts_ls.setup({
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	single_file_support = true,
	root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})

-- HTML
lspconfig.html.setup({
	filetypes = { "html", "templ" },
	root_dir = util.root_pattern(".git", "package.json"),
	single_file_support = true,
})

-- CSS/SCSS/Less
lspconfig.cssls.setup({
	filetypes = { "css", "scss", "less" },
	root_dir = util.root_pattern(".git", "package.json"),
	single_file_support = true,
})
