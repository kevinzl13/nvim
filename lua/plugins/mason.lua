return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim", -- Integración Mason + LSP
        "jay-babu/mason-null-ls.nvim", -- Integración Mason + Format/Lint
    },
    config = function()
        local servers = require("core.servers.lsp_servers")

        -- Configurar Mason
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- Instalar LSPs automáticamente
        require("mason-lspconfig").setup({
            ensure_installed = servers.lsp,
        })

        -- Instalar herramientas de formato y linting
        require("mason-null-ls").setup({
            ensure_installed = servers.tools,
            automatic_installation = true,
        })
    end,
}
