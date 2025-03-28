return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim", -- Gestor de servidores LSP
        "williamboman/mason-lspconfig.nvim", -- Integración de Mason con LSPconfig
        "jay-babu/mason-null-ls.nvim", -- Integración Mason con herramientas de formato/linting
        "hrsh7th/nvim-cmp", -- Autocompletado
        "hrsh7th/cmp-nvim-lsp", -- Fuente de autocompletado para LSP
        "L3MON4D3/LuaSnip", -- Snippets
        "folke/neodev.nvim", -- Mejoras para el LSP de Lua
    },
    opts = {
        inlay_hints = { enabled = true },
    },
    config = function()
        local servers = require("core.servers.lsp_servers")

        -- Configurar Mason
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = servers.lsp,
        })
        require("mason-null-ls").setup({
            ensure_installed = servers.tools,
            automatic_installation = true,
        })

        -- Configurar neodev.nvim (mejoras para el LSP de Lua)
        require("neodev").setup()

        -- Configuración mejorada para inlay hints
        local default_capabilities = vim.lsp.protocol.make_client_capabilities()
        default_capabilities.textDocument.inlayHint = { dynamicRegistration = true }

        -- Configurar capacidades mejoradas para LSP (integración con nvim-cmp)
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Función on_attach para configurar los keymaps personalizados para LSP
        local on_attach = function(client, bufnr)
            local keymaps = require("core.keymaps")
            keymaps.lsp_keymaps(bufnr)

            client.server_capabilities.inlayHintProvider = true

            -- Activar inlay hints para clientes que lo soporten
            -- if client.supports_method("textDocument/inlayHint") then
            --     local activate_hints = function()
            --         -- Prioriza el plugin si está disponible
            --         pcall(require("lsp-inlayhints").on_attach, client, bufnr)
            --         vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            --     end
            --
            --     -- Activar inmediatamente y al cargar el buffer
            --     vim.schedule(activate_hints)
            --     vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
            --         buffer = bufnr,
            --         callback = activate_hints,
            --     })
            -- end

            vim.defer_fn(function()
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

                -- 3. Reactiva al cambiar de buffer (opcional pero recomendado)
                vim.api.nvim_create_autocmd("BufEnter", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    end,
                })
            end, 3000)
        end

        -- Configurar todos los LSPs automáticamente con Mason
        -- require("mason-lspconfig").setup_handlers({
        --     function(server_name)
        --         require("lspconfig")[server_name].setup({
        --             on_attach = on_attach,
        --             capabilities = capabilities,
        --         })
        --     end,
        -- })

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                -- Configuración base para todos los servidores
                local opts = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }

                -- Fusionar configuraciones específicas si existen
                if servers.settings and servers.settings[server_name] then
                    opts = vim.tbl_deep_extend("force", opts, servers.settings[server_name])
                end

                -- Aplicar la configuración final
                require("lspconfig")[server_name].setup(opts)
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
