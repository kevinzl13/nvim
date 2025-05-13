# Proceso de Instalación de `nvim` con configuración desde el repositorio `kevinzl13/nvim`

Este proceso de instalación cubre los pasos necesarios para configurar `nvim` con las dependencias y herramientas necesarias.

## Prerequisitos

Antes de comenzar, asegúrate de tener las siguientes herramientas instaladas en tu sistema:

- **Neovim** 9.0 o superior
- **Go** (última versión estable)
- **Node.js** (última versión estable)
- **Rust** (última versión estable)
- **Python 3** (última versión estable)
- **Pip** (gestor de paquetes de Python)
- **GCC** (compilador de C)
- **G++** (compilador de C++)

## Instalación de Neovim

### Linux

- Make a backup of your current Neovim files:

```
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- Clone the starter

```
https://github.com/kevinzl13/nvim.git ~/.config/nvim
```

- Remove the .git folder, so you can add it to your own repo later

```
rm -rf ~/.config/nvim/.git
```

- Start Neovim!

```
nvim
```

### Windows

- Make a backup of your current Neovim files:

```
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

- Clone the starter

```
https://github.com/kevinzl13/nvim.git ~/.config/nvim
```

- Remove the .git folder, so you can add it to your own repo later

```
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim\.git
```

- Start Neovim!

```
nvim
```
