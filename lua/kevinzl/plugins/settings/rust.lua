local M = {}

-- Función on_init para manejar la inicialización del cliente LSP
M.on_init = function(client, _)
    -- Verificar si el cliente LSP soporta semantic tokens y deshabilitar el proveedor si es necesario
    if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

-- Generar capacidades del cliente LSP utilizando make_client_capabilities()
M.capabilities = vim.lsp.protocol.make_client_capabilities()

-- Configurar capacidades específicas para el manejo de completados
M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

-- Exportar el módulo M para su uso en otros archivos
return M
