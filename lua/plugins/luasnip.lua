return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    version = "v2.*",
    config = function()
        local ls = require("luasnip")
        local types = require("luasnip.util.types")
        require("luasnip.loaders.from_vscode").lazy_load()

        ls.config.set_config({
            -- Esto le dice a LuaSnip que recuerde el último fragmento,
            -- lo cual te permite saltar hacia atrás incluso si te mueves fuera de la selección
            history = true,

            -- Esto es interesante porque si tienes fragmentos dinámicos, se actualizan mientras escribes
            updateevents = "TextChanged,TextChangedI",

            -- Fragmentos automáticos (autosnippets)
            enable_autosnippets = true,

            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { "<- Choice", "Error" } },
                    },
                },
            },
        })
    end,
}
