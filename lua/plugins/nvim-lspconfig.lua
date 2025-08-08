return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'saghen/blink.cmp',
        "williamboman/mason.nvim", -- Gestor de servidores LSP
        "williamboman/mason-lspconfig.nvim", -- Integración de Mason con LSPconfig
    },
    config = function()
        require("config.lspconfig")
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local lspconfig = require('lspconfig')
        lspconfig['lua_ls'].setup({ capabilities = capabilities })
    end
}
