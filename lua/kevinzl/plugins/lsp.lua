return {
    'neovim/nvim-lspconfig',
    dependencies = {
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
        "hrsh7th/vscode-langservers-extracted",
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
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set({ 'n', 'i' }, '<A-S-f>', function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end

        -- configurar los servers

        require("neodev").setup({})
        local lspconfig = require('lspconfig')
        local util = require("lspconfig/util")
        local capabilities = require("kevinzl.plugins.settings.capabilities").capabilities



        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "lua-language-server" },
            filetypes = {
                "lua"
            },
            settings = {
                Lua = {
                    telemetry = { enable = false },
                    workspace = { checkThridParty = false },
                }
            },
            single_file_support = true,
            root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc",
                ".luacheckrc", ".stylua.toml", "stylua.toml",
                "selene.toml", "selene.yml", ".git")
        })
        lspconfig.pyright.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "pyright-langserver", "--stdio" },
            filetypes = {
                "python",
            },
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "openFilesOnly",
                        useLibraryCodeForTypes = true
                    },
                },
            },
            single_file_support = true,
            root_dir = util.root_pattern("requirements.txt", "py", "pyproject.toml", "setup.py", ".git"),
        })
        lspconfig.gopls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "gopls" },
            filetypes = {
                "go", "gomod", "gowork", "gotmpl"
            },
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                        unreachable = true,
                    },
                    staticcheck = true,
                },
            },
            root_dir = util.root_pattern("go.work", "go.mod", ".git")
        })
        lspconfig.clangd.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "clangd" },
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
        })
        lspconfig.ts_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "typescript-language-server", "--stdio" },
            filetypes = {
                "typescript", "typescriptreact", "javascript", "javascriptreact"
            },
            single_file_support = true,
            root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git")
        })
        lspconfig.rust_analyzer.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "rust-analyzer" },
            filetypes = { 'rust' },
            root_dir = util.root_pattern("Cargo.toml", "rust-project.json", ".git"),
            settings = {
                ['rust-analyzer'] = {
                    cargo = {
                        allFeatures = true,
                    },
                },
            },
            single_file_support = true,

        })
        lspconfig.html.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "vscode-html-language-server", "--stdio" },
            filetypes = {
                "html", "templ"
            },
            settings = {
                html = {
                    format = {
                        enable = true,
                    },
                    validate = {
                        enable = true,
                    },
                    completion = {
                        enable = true,
                    },
                    -- Configuración para lenguajes internos
                    embeddedLanguages = {
                        css = true,
                        javascript = true,
                    },
                },
            },
            root_dir = util.root_pattern('*.html', '.git', 'package.json', 'index.html'),
            single_file_support = true
        })
        lspconfig.cssls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "vscode-css-language-server", "--stdio" },
            filetypes = {
                "css", "scss", "less"
            },
            settings = {
                css = {
                    validate = true, -- Habilita la validación de archivos CSS
                },
                scss = {
                    validate = true, -- Habilita la validación de archivos SCSS
                },
                less = {
                    validate = true, -- Habilita la validación de archivos LESS
                },
            },
            root_dir = util.root_pattern("package.json", ".git", '*.css'),
            single_file_support = true,
        })
        lspconfig.emmet_ls.setup({
            on_attach = on_attach,
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            cmd = { "emmet-ls", "--stdio" },
            filetypes = {
                "astro", "css", "eruby", "html", "htmldjango",
                "javascriptreact", "less", "pug", "sass", "scss", "svelte",
                "typescriptreact", "vue", "htmlangular",
            },
            settings = {
                html = {
                    showSuggestionsAsSnippets = true, -- Mostrar sugerencias como fragmentos
                },
                css = {
                    showSuggestionsAsSnippets = true, -- Mostrar sugerencias como fragmentos
                },
            },
            root_dir = util.root_pattern('package.json', '.git', '*.html', "*.css", 'tsconfig.json'),
            single_file_support = true,
        })
    end
}
