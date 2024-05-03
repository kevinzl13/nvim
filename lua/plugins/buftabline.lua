return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = {
        'nvim-tree/nvim-web-devicons',
		'famiu/bufdelete.nvim'
    },
    config = function ()
        require("config.plugins.buftabline")
    end
}
