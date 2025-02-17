return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        -- Verificar si null-ls se puede cargar
        local null_ls_status_ok, null_ls = pcall(require, "null-ls")
        if not null_ls_status_ok then
            vim.notify("null-ls no está instalado o no se pudo cargar.", vim.log.levels.ERROR)
            return
        end

        -- Importar builtins de null-ls
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        -- Configurar null-ls
        null_ls.setup({
            sources = {
                -- Formateadores
                formatting.autopep8.with({
                    extra_args = { "--indent-size", "4" },
                }),
                formatting.prettier.with({
                    extra_args = { "--tab-width", "4", "--print-width", "80" },
                }),
                formatting.clang_format.with({
                    extra_args = {
                        "--style={BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never}",
                    },
                }),
                formatting.stylua.with({
                    extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
                }),

                -- Diagnósticos
                diagnostics.flake8.with({
                    extra_args = { "--extend-ignore=E501,E701,E702,E302,E305,W391" },
                }),

                diagnostics.eslint_d.with({
                    extra_args = { "--max-warnings=0" },
                    condition = function(utils)
                        return utils.root_has_file({ "package.json" })
                    end,
                }),
            },

            -- Opciones globales
            autostart = true,
            debug = false,

            -- Integración con LSP y keymaps
            -- Integración con LSP y keymaps
            on_attach = function(client, bufnr)
                local keymaps_status_ok, keymaps = pcall(require, "config.keymaps")
                if keymaps_status_ok and keymaps.lsp then
                    keymaps.lsp(bufnr)
                end

                -- Formateo automático al guardar
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                async = false,
                                filter = function(c)
                                    return c.name == "null-ls"
                                end,
                            })
                        end,
                    })
                end
            end,
        })
    end,
}
