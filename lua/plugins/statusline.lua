local lualine_setup = require("config.plugins.statusline")

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 
        'nvim-tree/nvim-web-devicons' 
    },
    config = lualine_setup,
}