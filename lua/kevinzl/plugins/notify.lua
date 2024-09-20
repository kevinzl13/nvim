return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require "notify"
		notify.setup({
			background_colour = "#282c34",
			stages = "static",
			timeout = 5000,
		})
		vim.notify = notify.notify
	end,
}
