return {
	lsp = {
		"lua_ls", -- Lua
		"pyright", -- Python
		"ts_ls", -- TypeScript/JavaScript
		"rust_analyzer", -- Rust
		"gopls", -- Go
		"jsonls", -- JSON
		"bashls", -- Bash
		"clangd", -- C/C++
		"marksman", -- Markdown
		"yamlls", -- YAML
		"html", -- HTML
		"cssls", -- CSS
		"emmet_language_server", -- Emmet
	},
	tools = {
		-- Formateadores
		"stylua", -- Lua
		"autopep8", -- Python
		"prettier", -- JS/TS/HTML/CSS
		"clang-format", -- C/C++

		-- Linters
		"flake8", -- Python
		"eslint_d", -- JS/TS (usa solo uno entre eslint_d o eslint)
		"cpplint", -- C/C++
		"golangci-lint", -- Go
	},
}
