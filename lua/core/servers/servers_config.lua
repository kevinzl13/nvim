local util = require("lspconfig.util")
local M = require("core.keymaps")

local on_attach = function(client, bufnr)
	-- Llamar a la función de keymaps personalizada
	M.lsp_keymaps(bufnr)

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

		-- Personalización de estilo (opcional)
		vim.api.nvim_set_hl(0, "LspInlayHint", {
			fg = "#7F7F7F", -- Color gris
			italic = true, -- Texto en cursiva
			-- bg = "#363636", -- Fondo opcional
		})
	end
end

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				telemetry = { enable = false },
				workspace = { checkThirdParty = false },
				hint = { enable = true },
			},
		},
		filetypes = { "lua" },
		single_file_support = true,
		root_dir = function(fname)
			return util.root_pattern(
				".luarc.json",
				".luarc.jsonc",
				".luacheckrc",
				".stylua.toml",
				"stylua.toml",
				"selene.toml",
				"selene.yml",
				".git"
			)(fname) or util.path.dirname(fname)
		end,
		on_attach = on_attach,
	},
	pyright = {
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
		root_dir = function(fname)
			return util.root_pattern("requirements.txt", "pyproject.toml", "setup.py", ".git")(fname)
				or util.path.dirname(fname)
		end,
		on_attach = on_attach,
	},
	gopls = {
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
		root_dir = function(fname)
			return util.root_pattern("go.work", "go.mod", ".git")(fname) or util.path.dirname(fname)
		end,
		on_attach = on_attach,
	},
	clangd = {
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		root_dir = function(fname)
			return util.root_pattern(
				".clangd",
				".clang-tidy",
				".clang-format",
				"compile_commands.json",
				"compile_flags.txt",
				"configure.ac",
				".git"
			)(fname) or util.path.dirname(fname)
		end,
		single_file_support = true,
		on_attach = on_attach,
	},
	ts_ls = {
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		single_file_support = true,
		root_dir = function(fname)
			return util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git")(fname)
				or util.path.dirname(fname)
		end,
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
		on_attach = on_attach,
	},

	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true, -- Carga todas las features del proyecto
					loadOutDirsFromCheck = true, -- Mejora la carga de directorios
					runBuildScripts = false, -- Permite analizar macros
					buildScripts = { enable = false },
				},
				checkOnSave = {
					command = "clippy", -- Usa Clippy en vez de check para mejor rendimiento
				},
				procMacro = {
					enable = false, -- Deshabilita macros de procedimiento
				},
				files = {
					exclude = { "target/**" }, -- Evita analizar archivos en target/
				},
				formatting = {
					enable = true, -- Activar formateo en rust-analyzer
				},
				inlayHints = {
					enable = true, -- Activar explícitamente (aunque el LSP ya lo hace)
					parameterHints = { enable = true },
					typeHints = { enable = true },
				},
			},
		},
		filetypes = { "rust" },
		root_dir = function(fname)
			return util.root_pattern("Cargo.toml", "rust-project.json", ".git")(fname) or util.path.dirname(fname)
		end,
		single_file_support = true,
		on_attach = on_attach,
	},

	cssls = {
		filetypes = { "css", "scss", "less" },
		root_dir = function(fname)
			return util.root_pattern(".git", "package.json")(fname) or util.path.dirname(fname)
		end,
		single_file_support = true,
		on_attach = on_attach,
	},

	html = {
		filetypes = { "html", "templ" },
		root_dir = function(fname)
			return util.root_pattern(".git", "package.json")(fname) or util.path.dirname(fname)
		end,
		single_file_support = true,
		on_attach = on_attach,
	},
}

return servers
