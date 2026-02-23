return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({
            "*", -- Activa el plugin para todos los tipos de archivo
            css = { rgb_fn = true }, -- Activa funciones rgb() y rgba() para CSS
            html = { names = true }, -- Activa nombres de colores en archivos HTML
        }, {
            RGB = true, -- Activar códigos hexadecimales #RGB
            RRGGBB = true, -- Activar códigos hexadecimales #RRGGBB
            names = true, -- Activar códigos de nombre de color (Ejemplo: Blue)
            RRGGBBAA = true, -- Activar códigos hexadecimales #RRGGBBAA (con alfa)
            rgb_fn = true, -- Activar funciones CSS rgb() y rgba()
            hsl_fn = true, -- Activar funciones CSS hsl() y hsla()
            css = true, -- Habilitar todas las características de CSS (rgb_fn, hsl_fn, names, RGB, RRGGBB)
            css_fn = true, -- Habilitar todas las funciones CSS (rgb_fn, hsl_fn)
            mode = "background", -- Establecer el modo de visualización (foreground o background)
        })
    end,
}

