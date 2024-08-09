local colortheme = "everforest"

vim.cmd("set background=dark")



return {
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function ()
		vim.cmd.colorscheme(colortheme)
		end,
	}
}
