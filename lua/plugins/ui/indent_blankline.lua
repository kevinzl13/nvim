return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}
	},
	config = function ()
		require("ibl").setup({})
	end
}

