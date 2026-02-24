# 💤 Mi Configuración de Neovim

## ⌨️ Leader Key

```
Leader: <Space>
```

---

# 🔑 Keybindings Personalizados

## 🧭 General

### 🔹 Normal Mode

| Atajo         | Acción                                  |
| ------------- | --------------------------------------- |
| `Ctrl + s`    | Guardar archivo                         |
| `Ctrl + q`    | Salir                                   |
| `<leader>o`   | Crear línea debajo sin entrar en insert |
| `//`          | Quitar resaltado de búsqueda            |
| `Tab`         | Siguiente buffer                        |
| `Shift + Tab` | Buffer anterior                         |
| `Alt + w`     | Cerrar buffer actual                    |

---

### 🔹 Insert Mode

| Atajo      | Acción              |
| ---------- | ------------------- |
| `Ctrl + s` | Guardar             |
| `Ctrl + q` | Salir a modo normal |

---

### 🔹 Visual Mode

| Atajo   | Acción                             |
| ------- | ---------------------------------- |
| `y`     | Copiar al portapapeles del sistema |
| `K`     | Mover selección arriba             |
| `J`     | Mover selección abajo              |
| `>`     | Indentar manteniendo selección     |
| `<`     | Desindentar manteniendo selección  |
| `Enter` | Mantener selección                 |

---

# 🌳 Oil Explorer — oil.nvim

| Atajo       | Acción                                    |
| ----------- | ----------------------------------------- |
| `<leader>e` | Toggle Oil Explorer (abrir/cerrar en cwd) |
| `<CR>`      | Abrir archivo / entrar en directorio      |
| `sv`        | Abrir en split vertical                   |
| `sh`        | Abrir en split horizontal                 |
| `st`        | Abrir en nueva pestaña                    |
| `-`         | Ir al directorio padre                    |
| `<BS>`      | Subir al directorio padre                 |
| `g.`        | Mostrar / ocultar archivos ocultos        |
| `gs`        | Cambiar método de ordenamiento            |
| `gx`        | Abrir con aplicación externa              |
| `q`         | Cerrar Oil                                |
| `<C-q>`     | Cerrar Oil                                |
| `<C-l>`     | Refrescar vista                           |

---

# 🖥️ ToggleTerm

## Normal Mode

| Atajo        | Acción              |
| ------------ | ------------------- |
| `<leader>tt` | Terminal horizontal |
| `<leader>tf` | Terminal flotante   |
| `<leader>tv` | Terminal vertical   |

## Terminal Mode

| Atajo      | Acción              |
| ---------- | ------------------- |
| `Esc`      | Salir a modo normal |
| `Ctrl + q` | Salir a modo normal |

### Configuración

- Dirección por defecto: horizontal
- Cierra al salir
- Sin sombreado
- Terminal flotante:
    - Borde curvo
    - Ancho: 100
    - Alto: 20
    - Transparencia: 20

---

# 🔎 Telescope

| Atajo        | Acción          |
| ------------ | --------------- |
| `<leader>ff` | Buscar archivos |
| `<leader>fg` | Live grep       |
| `<leader>fb` | Buffers         |
| `<leader>fh` | Help tags       |

### En modo insert dentro de Telescope

| Atajo      | Acción           |
| ---------- | ---------------- |
| `Ctrl + k` | Siguiente opción |
| `Ctrl + j` | Opción anterior  |
| `Ctrl + q` | Cerrar           |

Extensiones activadas:

- fzf
- file_browser
- ui-select

---

# 💬 Comment.nvim

| Atajo | Acción                     |
| ----- | -------------------------- |
| `gcc` | Comentar línea             |
| `gbc` | Comentar bloque            |
| `gc`  | Operador comentario línea  |
| `gb`  | Operador comentario bloque |
| `gcO` | Comentar línea arriba      |
| `gco` | Comentar línea abajo       |
| `gcA` | Comentar al final de línea |

---

# ⚡ blink.cmp (Autocompletado)

## Atajos

| Atajo         | Acción                      |
| ------------- | --------------------------- |
| `Ctrl + a`    | Mostrar / ocultar menú      |
| `Tab`         | Siguiente opción            |
| `Shift + Tab` | Opción anterior             |
| `↑`           | Opción anterior             |
| `↓`           | Siguiente opción            |
| `Enter`       | Aceptar sugerencia          |
| `Ctrl + b`    | Scroll documentación arriba |
| `Ctrl + f`    | Scroll documentación abajo  |
| `Ctrl + n`    | Mostrar documentación       |

### Fuentes activas

- LSP
- Path
- Snippets
- Emoji

---

# 🧠 LSP

| Atajo             | Acción              |
| ----------------- | ------------------- |
| `K`               | Hover               |
| `gd`              | Ir a definición     |
| `gD`              | Ir a declaración    |
| `gi`              | Ir a implementación |
| `<leader>D`       | Definición de tipo  |
| `<leader>rn`      | Renombrar           |
| `Alt + ,`         | Signature help      |
| `Alt + Shift + f` | Formatear           |

---

# ✂️ LuaSnip

| Atajo            | Acción                       |
| ---------------- | ---------------------------- |
| `Ctrl + Alt + k` | Expandir o siguiente snippet |
| `Ctrl + Alt + j` | Snippet anterior             |

---

# 🌲 Treesitter

Lenguajes instalados:

```
vim, vimdoc, lua, python, c, cpp, javascript, typescript,
json, bash, rust, go, markdown, yaml, toml, html,
css, cmake
```

### Textobjects

| Atajo | Acción                |
| ----- | --------------------- |
| `af`  | Función completa      |
| `if`  | Dentro de función     |
| `ac`  | Clase completa        |
| `ic`  | Dentro de clase       |
| `as`  | Scope                 |
| `ca`  | Condicional completo  |
| `ci`  | Dentro de condicional |
| `al`  | Loop completo         |
| `il`  | Dentro de loop        |

---

# 🧩 Inlay Hints

| Atajo        | Acción               |
| ------------ | -------------------- |
| `<leader>uh` | Alternar Inlay Hints |

---

# 🧠 Atajos Nativos de Neovim

## 🔢 Manejo de Números

| Atajo                    | Modo   | Acción                                     |
| ------------------------ | ------ | ------------------------------------------ |
| `Ctrl + a`               | Normal | Aumentar número bajo el cursor             |
| `Ctrl + x`               | Normal | Disminuir número bajo el cursor            |
| Selección + `g Ctrl + a` | Visual | Incrementar lista numerada automáticamente |

Ejemplo:

```
1.
2.
3.
```

---

## 📝 Crear Listas Numeradas Rápido

En modo normal:

```
numero de lineas + o + numero que empieza + Esc
```

Ejemplo:

```
5 + o + 1 + Esc
```

Luego:

```
numero de lineas + o + numero que empieza + . + Esc lista numerada
```

Ejemplo:

```
1.
```

---

## ✏️ Insert Mode Útil

| Atajo      | Acción                                               |
| ---------- | ---------------------------------------------------- |
| `Ctrl + j` | Crear nueva línea                                    |
| `Ctrl + w` | Borrar palabra anterior                              |
| `Ctrl + o` | Ejecutar un comando de modo normal y volver a insert |

---

## 🔎 Búsqueda Inteligente

| Atajo | Acción                               |
| ----- | ------------------------------------ |
| `*`   | Buscar palabra exacta bajo el cursor |
| `n`   | Ir a la siguiente coincidencia       |
| `N`   | Ir a la coincidencia anterior        |
| `g*`  | Buscar coincidencias parciales       |
| `g#`  | Buscar parcial hacia atrás           |

---

## 🧱 Visual Block (Edición en Múltiples Líneas)

1. `Ctrl + v` → Activar modo Visual Block
2. Seleccionar líneas
3. `I` → Insertar al inicio en todas las líneas
4. `A` → Insertar al final en todas las líneas
5. `G` → Seleccionar hasta el final del archivo

---

## 🔠 Mayúsculas y Minúsculas

| Atajo | Acción                                   |
| ----- | ---------------------------------------- |
| `~`   | Alternar mayúscula/minúscula de carácter |
| `gUw` | Palabra en MAYÚSCULAS                    |
| `guw` | Palabra en minúsculas                    |
| `guu` | Línea en minúsculas                      |
| `gUU` | Línea en MAYÚSCULAS                      |

Ejemplo:

```
HOLA mundo
HOLA MUNDO
hola mundo
```

---

## 📦 Folds (Plegado de Código)

| Atajo | Acción                        |
| ----- | ----------------------------- |
| `zf`  | Crear fold manual (ej: `zf%`) |
| `zd`  | Eliminar fold bajo cursor     |
| `zE`  | Eliminar todos los folds      |
| `za`  | Alternar fold (abrir/cerrar)  |
| `zA`  | Alternar fold recursivo       |
| `zM`  | Cerrar todos los folds        |
| `zR`  | Abrir todos los folds         |
| `zo`  | Abrir fold bajo cursor        |
| `zc`  | Cerrar fold bajo cursor       |

---

## 📐 Indentación

| Atajo  | Acción                                        |
| ------ | --------------------------------------------- |
| `==`   | Indentar línea actual                         |
| `=G`   | Indentar desde la línea actual hasta el final |
| `gg=G` | Indentar todo el documento                    |

---

## 📍 Navegación

| Atajo     | Acción                  |
| --------- | ----------------------- |
| `:numero` | Ir a línea específica   |
| `{}%`     | Saltar entre paréntesis |
| `()%`     | Saltar entre corchetes  |
| `[]%`     | Saltar entre llaves     |

---

## 🔗 Unir Líneas

| Atajo        | Acción                             |
| ------------ | ---------------------------------- |
| `Select + J` | Unir línea actual con la siguiente |
| `numero + J` | Unir numero de líneas consecutivas |

---

## 📥 Leer Archivos o Comandos

| Comando          | Acción                                  |
| ---------------- | --------------------------------------- |
| `:read ruta`     | Insertar contenido de archivo           |
| `:read !comando` | Insertar salida de comando en el cursor |
