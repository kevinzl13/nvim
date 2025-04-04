# Atajos de Teclado para Neovim

Este documento describe los atajos de teclado configurados para Neovim, organizados por categorías.

## Configuración General

- **Map Leader**: ` ` (espacio) - Tecla líder para acceder a combinaciones de teclas

## Navegación y Gestión de Ventanas

### Movimiento entre Ventanas

- `<A-h>`: Mover a ventana izquierda
- `<A-j>`: Mover a ventana inferior
- `<A-k>`: Mover a ventana superior
- `<A-l>`: Mover a ventana derecha

### Gestión de Buffers

- `<Tab>`: Cambiar al siguiente buffer
- `<S-Tab>`: Cambiar al buffer anterior
- `<A-w>`: Cerrar buffer actual (`:Bdelete`)

## Explorador de Archivos

- `<C-b>`: Alternar NvimTree (explorador de archivos)

## Búsqueda y Selección

- `//`: Limpiar resaltado de búsqueda
- `y` (modo visual): Copiar al portapapeles del sistema (`"+y`)

## Modo Inserción

- `<C-h>`: Mover cursor a la izquierda
- `<C-j>`: Mover cursor abajo
- `<C-k>`: Mover cursor arriba
- `<C-l>`: Mover cursor a la derecha
- `<C-s>`: Guardar archivo
- `<C-q>`: Salir del modo inserción (equivale a Esc)

## Modo Normal

- `<C-s>`: Guardar archivo
- `<C-q>`: Cerrar ventana (`:q`)

## Terminal

- `<leader>tt`: Abrir terminal horizontal
- `<leader>tf`: Abrir terminal flotante
- `<leader>tv`: Abrir terminal vertical
- `<Esc>` (en terminal): Salir del modo terminal
- `<C-q>` (en terminal): Salir del modo terminal

## Indentación

- `K` (modo visual): Mover selección hacia arriba
- `J` (modo visual): Mover selección hacia abajo
- `<` (modo visual): Disminuir indentación
- `>` (modo visual): Aumentar indentación

## LSP (Language Server Protocol)

- `K`: Mostrar información de hover
- `gD`: Ir a declaración
- `gd`: Ir a definición
- `gi`: Ir a implementación
- `<C-k>`: Mostrar ayuda de firma
- `<leader>D`: Ir a definición de tipo
- `<leader>rn`: Renombrar símbolo
- `<leader>ca`: Mostrar acciones de código
- `gr`: Mostrar referencias
- `<A-S-f>`: Formatear documento

## Telescope

- `<leader>ff`: Buscar archivos
- `<leader>fg`: Búsqueda en vivo (live grep)
- `<leader>fb`: Listar buffers abiertos
- `<leader>fh`: Buscar en etiquetas de ayuda

### Atajos en modo inserción de Telescope

- `<C-k>`: Mover a siguiente opción
- `<C-j>`: Mover a opción anterior
- `<C-q>`: Cerrar Telescope

## Tree-sitter Textobjects

- `af`: Seleccionar función completa
- `if`: Seleccionar cuerpo de función
- `ac`: Seleccionar clase completa
- `ic`: Seleccionar cuerpo de clase
- `ca`: Seleccionar condicional completa
- `ci`: Seleccionar cuerpo de condicional
- `al`: Seleccionar loop completo
- `il`: Seleccionar cuerpo de loop

## Comentarios

- `gcc`: Alternar comentario de línea
- `gbc`: Alternar comentario de bloque
- `gc`: Operador para comentar (ej. `gcw` para comentar palabra)
- `gb`: Operador para comentar bloque
- `gcO`: Añadir comentario encima de la línea
- `gco`: Añadir comentario debajo de la línea
- `gcA`: Añadir comentario al final de la línea

## Autocompletado (CMP)

- `<TAB>`: Seleccionar siguiente elemento
- `<S-TAB>`: Seleccionar elemento anterior
- `<CR>`: Confirmar selección
- `<C-a>`: Alternar menú de autocompletado
- `<C-j>`: Mover rápido hacia abajo en el menú
- `<C-k>`: Mover rápido hacia arriba en el menú
- `<C-t>`: Scroll hacia arriba en documentación
- `<C-g>`: Scroll hacia abajo en documentación

## Misceláneos

- `<F12>`: Recargar archivo actual (`:source %`)
- `<leader>uh`: Alternar inlay hints del LSP
- `<leader>fs`: Búsqueda con rip-substitute
