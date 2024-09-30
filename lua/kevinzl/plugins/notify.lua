return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require "notify"
        notify.setup({
            background_colour = "#282c34",
            stages = "fade",
            timeout = 2000, -- Ajustar el tiempo de visualización
            top_down = false,
            max_width = 60, -- Ancho máximo para forzar el salto de línea
            max_height = 25,
            fill_group = "Notify",
            border = "rounded",
            icons = {
                ERROR = "",
                WARN = "",
                INFO = "",
                DEBUG = "",
                TRACE = "",
            },
            render = "wrapped-compact",
            levels = {
                ERROR = { background = "#8B0000", foreground = "#FFDAB9" },
                WARN = { background = "#D3A623", foreground = "#FFFFFF" },
                INFO = { background = "#A3D3A1", foreground = "#000000" },
                DEBUG = { background = "#5F9EA0", foreground = "#FFFFFF" },
                TRACE = { background = "#C0C0C0", foreground = "#000000" },
            },
        })
        vim.notify = notify.notify
    end,
}
