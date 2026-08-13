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

## 🎨 Cambiar Tema

| Atajo        | Acción                                        |
| ------------ | --------------------------------------------- |
| `<leader>ts` | Abrir selector de temas y cambiar colorscheme |

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
| `gUl` | Primera letra en mauúscula               |
| `gul` | Primera letra en minúscula               |
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

## Atajos de nvim-surround

### 🎨 Modo Visual (seleccionas texto primero)

## Atajos de nvim-surround

### 🎨 Modo Visual (seleccionas texto primero)

| Atajo | Resultado                     | Ejemplo                                        |
| ----- | ----------------------------- | ---------------------------------------------- |
| `S"`  | Envuelve con comillas dobles  | `hola` → `"hola"`                              |
| `S'`  | Envuelve con comillas simples | `hola` → `'hola'`                              |
| `S(`  | Envuelve con paréntesis       | `hola` → `(hola)`                              |
| `S[`  | Envuelve con corchetes        | `hola` → `[hola]`                              |
| `S{`  | Envuelve con llaves           | `hola` → `{hola}`                              |
| `S<`  | Envuelve con mayor/menor      | `hola` → `<hola>`                              |
| `St`  | Envuelve con etiqueta HTML    | `hola` → `<div>hola</div>` (te pide el nombre) |
| `S=`  | Envuelve con `=` y espacios   | `hola` → `= hola =`                            |
| `S*`  | Envuelve con `*` y espacios   | `hola` → `* hola *`                            |

---

### ⌨️ Modo Normal (sin seleccionar)

#### Para palabras

| Atajo   | Desglose               | Resultado                  | Ejemplo                    |
| ------- | ---------------------- | -------------------------- | -------------------------- |
| `ysiw"` | `y` + `s` + `iw` + `"` | Envuelve palabra con `"`   | `hola` → `"hola"`          |
| `ysiw'` | `y` + `s` + `iw` + `'` | Envuelve palabra con `'`   | `hola` → `'hola'`          |
| `ysiw(` | `y` + `s` + `iw` + `(` | Envuelve palabra con `()`  | `hola` → `(hola)`          |
| `ysiw[` | `y` + `s` + `iw` + `[` | Envuelve palabra con `[]`  | `hola` → `[hola]`          |
| `ysiw{` | `y` + `s` + `iw` + `{` | Envuelve palabra con `{}`  | `hola` → `{hola}`          |
| `ysiw<` | `y` + `s` + `iw` + `<` | Envuelve palabra con `<>`  | `hola` → `<hola>`          |
| `ysiwt` | `y` + `s` + `iw` + `t` | Envuelve con etiqueta HTML | `hola` → `<tag>hola</tag>` |

#### Para palabras con puntos

| Atajo   | Desglose               | Resultado                          | Ejemplo                   |
| ------- | ---------------------- | ---------------------------------- | ------------------------- |
| `ysiW"` | `y` + `s` + `iW` + `"` | Envuelve palabra (incluye puntos)  | `mi.texto` → `"mi.texto"` |
| `ysiW'` | `y` + `s` + `iW` + `'` | Envuelve con `'` (incluye puntos)  | `mi.texto` → `'mi.texto'` |
| `ysiW(` | `y` + `s` + `iW` + `(` | Envuelve con `()` (incluye puntos) | `mi.texto` → `(mi.texto)` |

#### Para líneas

| Atajo  | Desglose              | Resultado                        | Ejemplo                       |
| ------ | --------------------- | -------------------------------- | ----------------------------- |
| `yss"` | `y` + `s` + `s` + `"` | Envuelve línea completa con `"`  | `hola mundo` → `"hola mundo"` |
| `yss'` | `y` + `s` + `s` + `'` | Envuelve línea completa con `'`  | `hola mundo` → `'hola mundo'` |
| `yss(` | `y` + `s` + `s` + `(` | Envuelve línea completa con `()` | `hola mundo` → `(hola mundo)` |
| `yss[` | `y` + `s` + `s` + `[` | Envuelve línea completa con `[]` | `hola mundo` → `[hola mundo]` |
| `yss{` | `y` + `s` + `s` + `{` | Envuelve línea completa con `{}` | `hola mundo` → `{hola mundo}` |
| `ysst` | `y` + `s` + `s` + `t` | Envuelve línea con etiqueta HTML | `hola` → `<tag>hola</tag>`    |

---

### 🗑️ Eliminar (Delete Surround)

| Atajo | Desglose        | Resultado                | Ejemplo                    |
| ----- | --------------- | ------------------------ | -------------------------- |
| `ds"` | `d` + `s` + `"` | Elimina comillas dobles  | `"hola"` → `hola`          |
| `ds'` | `d` + `s` + `'` | Elimina comillas simples | `'hola'` → `hola`          |
| `ds(` | `d` + `s` + `(` | Elimina paréntesis       | `(hola)` → `hola`          |
| `ds[` | `d` + `s` + `[` | Elimina corchetes        | `[hola]` → `hola`          |
| `ds{` | `d` + `s` + `{` | Elimina llaves           | `{hola}` → `hola`          |
| `ds<` | `d` + `s` + `<` | Elimina mayor/menor      | `<hola>` → `hola`          |
| `dst` | `d` + `s` + `t` | Elimina etiqueta HTML    | `<div>hola</div>` → `hola` |

---

### 🔄 Cambiar (Change Surround)

| Atajo  | Desglose              | Resultado              | Ejemplo                      |
| ------ | --------------------- | ---------------------- | ---------------------------- |
| `cs"'` | `c` + `s` + `"` + `'` | Cambia `"` a `'`       | `"hola"` → `'hola'`          |
| `cs'"` | `c` + `s` + `'` + `"` | Cambia `'` a `"`       | `'hola'` → `"hola"`          |
| `cs([` | `c` + `s` + `(` + `[` | Cambia `()` a `[]`     | `(hola)` → `[hola]`          |
| `cs[{` | `c` + `s` + `[` + `{` | Cambia `[]` a `{}`     | `[hola]` → `{hola}`          |
| `cs{"` | `c` + `s` + `{` + `"` | Cambia `{}` a `""`     | `{hola}` → `"hola"`          |
| `cs<t` | `c` + `s` + `<` + `t` | Cambia `<>` a etiqueta | `<hola>` → `<div>hola</div>` |
| `cst"` | `c` + `s` + `t` + `"` | Cambia etiqueta a `""` | `<div>hola</div>` → `"hola"` |

---

### 🆕 Atajos adicionales muy útiles

| Atajo   | Desglose               | Resultado                    | Ejemplo             |
| ------- | ---------------------- | ---------------------------- | ------------------- |
| `ysiw`  | `y` + `s` + `iw` + `}` | Envuelve con `{}` y espacios | `hola` → `{ hola }` |
| `ysiw]` | `y` + `s` + `iw` + `]` | Envuelve con `[]` y espacios | `hola` → `[ hola ]` |
| `S)`    | igual que `S(`         | Envuelve con paréntesis      | `hola` → `(hola)`   |
| `S]`    | igual que `S[`         | Envuelve con corchetes       | `hola` → `[hola]`   |
| `S}`    | igual que `S{`         | Envuelve con llaves          | `hola` → `{hola}`   |
| `S>`    | igual que `S<`         | Envuelve con mayor/menor     | `hola` → `<hola>`   |

# Atajos en terminal

En la mayoría de terminales (bash, zsh, fish, etc.) los atajos de edición vienen de **Readline** (modo Emacs por defecto). Estos son los más útiles:

### Movimiento del cursor

| Atajo      | Acción                           |
| ---------- | -------------------------------- |
| `Ctrl + A` | Ir al inicio de la línea         |
| `Ctrl + E` | Ir al final de la línea          |
| `Alt + B`  | Mover una palabra hacia atrás    |
| `Alt + F`  | Mover una palabra hacia adelante |
| `Ctrl + F` | Mover un carácter adelante       |
| `Ctrl + B` | Mover un carácter atrás          |

### Borrar texto

| Atajo      | Acción                                                       |
| ---------- | ------------------------------------------------------------ |
| `Ctrl + W` | Borrar la palabra anterior                                   |
| `Ctrl + U` | Borrar desde el cursor hasta el inicio                       |
| `Ctrl + K` | Borrar desde el cursor hasta el final                        |
| `Ctrl + H` | Borrar un carácter atrás (como Backspace)                    |
| `Ctrl + D` | Borrar un carácter adelante (o salir si la línea está vacía) |

### Historial

| Atajo      | Acción                 |
| ---------- | ---------------------- |
| `Ctrl + P` | Comando anterior       |
| `Ctrl + N` | Comando siguiente      |
| `Ctrl + R` | Buscar en el historial |
| `↑ / ↓`    | Navegar por historial  |

### Control de procesos

| Atajo      | Acción                               |
| ---------- | ------------------------------------ |
| `Ctrl + C` | Interrumpir comando actual           |
| `Ctrl + Z` | Suspender proceso                    |
| `Ctrl + D` | Cerrar sesión / enviar EOF           |
| `Ctrl + L` | Limpiar pantalla (igual que `clear`) |

### Atajos de palabras (muy usados)

| Atajo             | Acción                            |
| ----------------- | --------------------------------- |
| `Alt + Backspace` | Borrar una palabra hacia atrás    |
| `Alt + D`         | Borrar una palabra hacia adelante |
| `Ctrl + Y`        | Pegar lo último borrado           |
| `Alt + T`         | Intercambiar dos palabras         |

# Tmux

Lista de atajos útiles de **tmux** (prefijo por defecto: `Ctrl+b`).

> `Prefix` significa pulsar `Ctrl+b`, soltar, y después pulsar la tecla indicada.

---

# Ventanas (Windows)

| Atajo          | Acción                                   |
| -------------- | ---------------------------------------- |
| `Prefix + c`   | Crear nueva ventana                      |
| `Prefix + n`   | Ir a la siguiente ventana                |
| `Prefix + p`   | Ir a la ventana anterior                 |
| `Prefix + 0-9` | Ir directamente a una ventana por número |
| `Prefix + w`   | Mostrar lista de ventanas                |
| `Prefix + ,`   | Renombrar ventana actual                 |
| `Prefix + &`   | Cerrar ventana actual                    |
| `Prefix + f`   | Buscar ventana por nombre                |
| `Prefix + l`   | Volver a la ventana anterior usada       |

---

# Paneles (Panes)

| Atajo              | Acción                           |
| ------------------ | -------------------------------- |
| `Prefix + %`       | Dividir panel verticalmente      |
| `Prefix + "`       | Dividir panel horizontalmente    |
| `Prefix + flechas` | Moverse entre paneles            |
| `Prefix + o`       | Rotar entre paneles              |
| `Prefix + ;`       | Volver al panel anterior         |
| `Prefix + q`       | Mostrar números de panel         |
| `Prefix + z`       | Maximizar/restaurar panel actual |
| `Prefix + x`       | Cerrar panel actual              |
| `Prefix + {`       | Mover panel a la izquierda       |
| `Prefix + }`       | Mover panel a la derecha         |
| `Prefix + !`       | Convertir panel en nueva ventana |

---

# Redimensionar paneles

| Atajo                     | Acción                                                 |
| ------------------------- | ------------------------------------------------------ |
| `Prefix + Ctrl + flechas` | Redimensionar paneles                                  |
| `Prefix + h`              | Redimensionar hacia la izquierda (si está configurado) |
| `Prefix + j`              | Redimensionar hacia abajo (si está configurado)        |
| `Prefix + k`              | Redimensionar hacia arriba (si está configurado)       |
| `Prefix + l`              | Redimensionar hacia la derecha (si está configurado)   |

---

# Copiar y pegar

| Atajo        | Acción               |
| ------------ | -------------------- |
| `Prefix + [` | Entrar en modo copia |
| `Space`      | Iniciar selección    |
| `Enter`      | Copiar selección     |
| `q`          | Salir del modo copia |
| `Prefix + ]` | Pegar texto copiado  |

---

# Sesiones

| Comando                       | Acción                                  |
| ----------------------------- | --------------------------------------- |
| `tmux new -s nombre`          | Crear sesión con nombre                 |
| `tmux ls`                     | Ver sesiones activas                    |
| `tmux attach`                 | Volver a la sesión anterior             |
| `tmux attach -t nombre`       | Entrar a una sesión concreta            |
| `tmux kill-session -t nombre` | Cerrar una sesión                       |
| `Prefix + d`                  | Desconectarse dejando tmux ejecutándose |

---

# Modo comando

| Atajo        | Acción                          |
| ------------ | ------------------------------- |
| `Prefix + :` | Abrir línea de comandos de tmux |

Comandos útiles:

| Comando        | Acción                  |
| -------------- | ----------------------- |
| `new-window`   | Crear ventana           |
| `split-window` | Crear panel             |
| `list-windows` | Listar ventanas         |
| `list-panes`   | Listar paneles          |
| `resize-pane`  | Cambiar tamaño de panel |
| `set mouse on` | Activar ratón           |

---

# Información y ayuda

| Atajo        | Acción                   |
| ------------ | ------------------------ |
| `Prefix + ?` | Mostrar todos los atajos |
| `Prefix + t` | Mostrar reloj            |
| `Prefix + s` | Lista de sesiones        |
| `Prefix + i` | Información del panel    |

---

# Comandos de administración

| Comando                         | Acción                    |
| ------------------------------- | ------------------------- |
| `tmux new`                      | Crear nueva sesión        |
| `tmux ls`                       | Listar sesiones           |
| `tmux attach`                   | Reconectar a una sesión   |
| `tmux kill-server`              | Cerrar todas las sesiones |
| `tmux source-file ~/.tmux.conf` | Recargar configuración    |

---

# Atajos esenciales

| Acción                   | Atajo            |
| ------------------------ | ---------------- |
| Nueva ventana            | `Ctrl+b c`       |
| Cambiar ventana          | `Ctrl+b n/p`     |
| Cambiar por número       | `Ctrl+b 0-9`     |
| Dividir panel vertical   | `Ctrl+b %`       |
| Dividir panel horizontal | `Ctrl+b "`       |
| Moverse entre paneles    | `Ctrl+b flechas` |
| Maximizar panel          | `Ctrl+b z`       |
| Cerrar panel             | `Ctrl+b x`       |
| Copiar texto             | `Ctrl+b [`       |
| Pegar texto              | `Ctrl+b ]`       |
| Desconectar sesión       | `Ctrl+b d`       |
| Volver a tmux            | `tmux attach`    |
| Ver sesiones             | `tmux ls`        |
| Ver ayuda                | `Ctrl+b ?`       |
