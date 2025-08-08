return {
  {
    "nvim-tree/nvim-tree.lua",  -- Plugin de explorador de archivos
    dependencies = { "nvim-tree/nvim-web-devicons" },  -- Iconos para el explorador
    config = function()
      -- Configuración de nvim-tree
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,  -- Ancho del explorador
          side = "left",  -- Posición del explorador (izquierda o derecha)
          preserve_window_proportions = true,
          adaptive_size = false,
        },
        renderer = {
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "▶",  -- Ícono para carpeta cerrada
                arrow_open = "▼",    -- Ícono para carpeta abierta
                default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
							symlink_open = "",
              },
            },
            show = {
              file = true,  -- Mostrar iconos para archivos
              folder = true,  -- Mostrar iconos para carpetas
              folder_arrow = true,  -- Mostrar flechas para carpetas
            },
          },
          indent_markers = {
            enable = true,  -- Mostrar marcadores de indentación
          },
          add_trailing = false,  -- No agregar información adicional al final de las líneas
          full_name = false,
        },
        filters = {
          dotfiles = false,  -- Mostrar archivos y carpetas ocultos
        },
      })

    end,
  },
}


