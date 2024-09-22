return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require "notify"
		notify.setup({
			background_colour = "#282c34",
			stages = "fade",
			timeout = 2000,
			render = "minimal",
			top_down = false,
			max_width = 50,
		})
		vim.notify = notify.notify
	end,
}
