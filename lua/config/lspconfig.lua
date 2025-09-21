local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_text = true,
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

local function on_attach_inlay(client, bufnr)
	if client.server_capabilities.inlayHintsProvider then
		vim.lsp.inlay_hint.enable(true, { buf = bufnr })
	end
end

--- Config Lsp
-- Lua
lspconfig.lua_ls.setup({
	cmd = { "lua-language-server" },
	capabilities = capabilities,
	on_attach = on_attach_inlay,
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
-- 	on_attach = on_attach_inlay,
-- 	filetypes = { "python" },
-- 	single_file_support = true,
-- 	settings = {
-- 		python = {
-- 			analysis = {
-- 				autoSearchPaths = true,
-- 				diagnosticMode = "openFilesOnly",
-- 				useLibraryCodeForTypes = true,
-- 				typeCheckingMode = "basic",
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
	on_attach = on_attach_inlay,
	filetypes = { "python" },
	single_file_support = true,
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,

				-- opciones
				-- "basic"
				-- "standard"
				-- "strict"
				typeCheckingMode = "standard",

				-- opciones
				-- "none" - No mostrar el diagnóstico
				-- "information" - Mostrar como información (azul/gris)
				-- "warning" - Mostrar como warning (amarillo)
				-- "error" - Mostrar como error (rojo)

				-- Solo errores/warnings para cosas realmente importantes
				reportMissingParameterType = "none", -- No molestar por tipos de parámetros
				reportMissingTypeArgument = "none", -- No molestar por argumentos de tipo
				reportUnknownParameterType = "none", -- No molestar por parámetros unknown
				reportUnknownVariableType = "none", -- No molestar por variables unknown
				reportUnknownMemberType = "none", -- No molestar por miembros unknown
				reportUnknownArgumentType = "none", -- No molestar por argumentos unknown
				reportUnannotatedClassAttribute = "none", -- No molestar por atributos sin anotar
				reportMissingTypeStubs = "none", -- No molestar por stubs faltantes

				-- Solo mantener errores importantes
				reportGeneralTypeIssues = "error", -- Errores de tipo reales
				reportOptionalMemberAccess = "warning", -- Acceso a None potencial
				reportOptionalSubscript = "warning", -- Subscript en None
				reportConstantRedefinition = "error", -- Redefinición de constantes
				reportInvalidStringEscapeSequence = "error", -- Secuencias de escape inválidas
				reportUndefinedVariable = "error", -- Variables no definidas
				reportAssertAlwaysTrue = "warning", -- Assert que siempre es true
				reportFunctionMemberAccess = "none", -- No molestar con acceso a miembros de función

				-- Más opciones útiles
				reportUnusedImport = "warning", -- Imports no usados
				reportUnusedClass = "information", -- Clases no usadas
				reportUnusedFunction = "information", -- Funciones no usadas
				reportUnusedVariable = "warning", -- Variables no usadas
				reportDuplicateImport = "error", -- Imports duplicados
				reportWildcardImportFromLibrary = "warning", -- Import * de librerías
				reportImplicitStringConcatenation = "none", -- Concatenación implícita de strings
				reportCallInDefaultInitializer = "none", -- Llamadas en valores por defecto
				reportPropertyTypeMismatch = "error", -- Tipos incorrectos en propiedades
				reportImportCycles = "error", -- Ciclos de importación
				reportPrivateUsage = "none", -- Uso de miembros privados
				reportTypeCommentUsage = "none", -- Comentarios de tipo obsoletos
				reportIncompatibleMethodOverride = "error", -- Override incompatible
				reportIncompatibleVariableOverride = "error", -- Variable override incompatible
				reportOverlappingOverloads = "error", -- Overloads que se superponen

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
	on_attach = on_attach_inlay,
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
	on_attach = on_attach_inlay,
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
	on_attach = on_attach_inlay,
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
	on_attach = on_attach_inlay,
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
	on_attach = on_attach_inlay,
	filetypes = { "html", "templ" },
	single_file_support = true,
	root_dir = util.root_pattern(".git", "package.json"),
})

-- CSS / SCSS / Less
lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach_inlay,
	filetypes = { "css", "scss", "less" },
	single_file_support = true,
	root_dir = util.root_pattern(".git", "package.json"),
})
