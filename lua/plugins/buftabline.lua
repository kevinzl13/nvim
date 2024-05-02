return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function ()
        require("config.plugins.buftabline")
    end
}