local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.diagnostic.config({
	virtual_lines = true,
	-- virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

-- Autocmd group for LspAttach
local user_lsp_group = vim.api.nvim_create_augroup("UserLspConfig", {})
local function on_attach(client, bufnr)
	-- Solución al error de semanticTokens
	client.server_capabilities.semanticTokensProvider = nil

	local opts = { buffer = bufnr }

	-- Keymaps
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set({ "i", "n" }, "<A-,>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)

	-- Luasnip navegación
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

	-- Formateo
	vim.keymap.set({ "n", "i" }, "<A-S-f>", function()
		require("conform").format({ async = true, lsp_fallback = true })
	end, opts)
end

--- Config Lsp
-- Lua
lspconfig.lua_ls.setup({
	cmd = { "lua-language-server" },
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "lua" },
	single_file_support = true,
	settings = {
		Lua = {
			telemetry = {
				enable = false,
			},
			workspace = {
				checkThirdParty = false,
			},
			hint = {
				enable = true,
				setType = true,
				paramType = true,
				paramName = "All", -- "All" | "Disable" | "Literal"
				semicolon = "All", -- "All" | "SameLine" | "Disable"
				arrayIndex = "All", -- "All" | "Enable" | "Auto" | "Disable"
			},
		},
	},
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

-- lspconfig.pyright.setup({
-- 	cmd = { "pyright-langserver", "--stdio" },
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	filetypes = { "python" },
-- 	single_file_support = true,
-- 	settings = {
-- 		python = {
-- 			analysis = {
-- 				autoSearchPaths = true,
-- 				diagnosticMode = "openFilesOnly",
-- 				useLibraryCodeForTypes = true,
-- 				inlayHints = {
-- 					functionReturnTypes = true,
-- 					variableTypes = true,
-- 					parameterNames = true,
-- 					callArgumentNames = true,
-- 					genericTypes = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- 	root_dir = util.root_pattern(
-- 		"pyproject.toml",
-- 		"setup.py",
-- 		"setup.cfg",
-- 		"requirements.txt",
-- 		"Pipfile",
-- 		"pyrightconfig.json",
-- 		".git"
-- 	),
-- })

lspconfig.basedpyright.setup({
	cmd = { "basedpyright-langserver", "--stdio" },
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "python" },
	single_file_support = true,
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				inlayHints = {
					functionReturnTypes = true,
					variableTypes = true,
					parameterNames = true,
					callArgumentNames = true,
					genericTypes = true,
				},
			},
		},
	},
	root_dir = util.root_pattern(
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git"
	),
})

-- Go
lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	single_file_support = true,
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
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
})

-- Rust
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "rust" },
	single_file_support = true,
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
				bindingModeHints = { enable = false },
				chainingHints = { enable = true },
				closingBraceHints = { enable = true, minLines = 25 },
				closureReturnTypeHints = { enable = "never" },
				lifetimeElisionHints = { enable = "never", useParameterNames = false },
				maxLength = 25,
				parameterHints = { enable = true },
				reborrowHints = { enable = "never" },
				renderColons = true,
				typeHints = { enable = true, hideClosureInitialization = false, hideNamedConstructor = false },
			},
		},
	},
	root_dir = util.root_pattern("Cargo.toml", "rust-project.json", ".git"),
})

-- C/C++
lspconfig.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	single_file_support = true,
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
		"--inlay-hints", -- Habilitar inlay hints explícitamente
	},
	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true,
	},
	root_dir = util.root_pattern(
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git"
	),
})

-- TypeScript / JavaScript
lspconfig.ts_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
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
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "templ" },
	single_file_support = true,
	root_dir = util.root_pattern(".git", "package.json"),
})

-- CSS / SCSS / Less
lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "css", "scss", "less" },
	single_file_support = true,
	root_dir = util.root_pattern(".git", "package.json"),
})
