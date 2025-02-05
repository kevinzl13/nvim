return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "neovim/nvim-lspconfig",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "windwp/nvim-autopairs",
        "onsails/lspkind.nvim", -- Integración con lspkind.nvim
    },
    event = "VeryLazy",
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind") -- Cargar lspkind.cmp-nvim-lsp

        -- Cargar keymaps desde config.keymaps.lua
        local keymaps = require("core.keymaps")

        -- Definir colores personalizados para el autocompletado de nvim-cmp
        vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#A0A8B7" }) -- Texto general (gris suave)
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#FFB86C", bold = true }) -- Coincidencias (naranja suave)
        vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#FF79C6" }) -- Funciones (rosa claro)
        vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#8BE9FD" }) -- Variables (azul claro)
        vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#50FA7B" }) -- Clases (verde claro)
        vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#FF79C6" }) -- Menú (rosa suave)

        -- Colores para el ítem seleccionado
        vim.api.nvim_set_hl(0, "CmpItemSelected", { fg = "#282A36", bg = "#FFB86C", bold = true }) -- Fondo claro con texto oscuro

        -- Colores del menú de selección de elementos (PmenuSel)
        vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#282A36", bg = "#FFB86C", bold = true }) -- Fondo claro, texto oscuro

        -- Resaltado de la lista del menú
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1E1F29", fg = "#A0A8B7" }) -- Fondo oscuro, texto gris suave

        -- Colores para los ítems de autocompletado
        vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#D1C8B5" }) -- Texto (amarillo suave)
        vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#FF79C6" }) -- Palabras clave (rosa)
        vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#FFB86C" }) -- Métodos (naranja suave)
        vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#F1FA8C" }) -- Constructores (amarillo claro)
        vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#50FA7B" }) -- Módulos (verde claro)
        vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#8BE9FD" }) -- Campos (azul claro)
        vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#8BE9FD" }) -- Propiedades (azul claro)
        vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#FF5555" }) -- Eventos (rojo suave)
        vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#FFB86C" }) -- Operadores (naranja suave)
        vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D1C8B5" }) -- Parámetros de tipo (amarillo suave)

        -- Configurar nvim-cmp
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- Expandir snippets con LuaSnip
                end,
            },
            mapping = keymaps.cmp(cmp), -- Usar los keymaps definidos en keymaps.lua
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 1000 }, -- Fuente: LSP
                { name = "luasnip", priority = 100 }, -- Fuente: Snippets
            }, {
                { name = "buffer", priority = 800 }, -- Fuente: Buffer actual
                { name = "path", priority = 700 }, -- Fuente: Rutas de archivos
            }),
            formatting = {
                format = function(entry, vim_item)
                    -- Usa lspkind para íconos + formatea el texto
                    vim_item.kind = string.format(" %s %s", lspkind.symbol_map[vim_item.kind] or "", vim_item.kind)
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            window = {
                completion = {
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                },
                documentation = {
                    winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
                },
            },
        })

        -- Configurar lspkind
        lspkind.init({
            mode = "symbol_text",
            preset = "default",
            symbol_map = {
                Text = "",
                Method = "",
                Function = "󰊕",
                Constructor = "",
                Field = "",
                Variable = "󰀫",
                Class = "",
                Interface = "",
                Module = "",
                Property = "",
                Unit = "",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "",
                Event = "",
                Operator = "",
                TypeParameter = "",
            },
        })

        -- Integración con nvim-autopairs
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
