local buftabline = require("bufferline")

vim.opt.termguicolors = true

 --local buffers_open = false

buftabline.setup {
    options = {
		mode = "buffers",
	    numbers = "ordinal",	
		--open_fn = function()
        -- if not buffers_open then
		-- 	buffers_open = true
        --         return {
        --             path = "",
        --             cmd = "enew",
        --         }
        --     end
        -- end,
        indicator = {
			icon = "▎",
			style = 'icon'
        },
        buffer_close_icon = '󰅙',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        diagnostics = "coc",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
        end,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        separator_style = "thin",
        highlights = {
                fill = {
                    bg = {
                        attribute = "fg",
                        highlight = "Pmenu"
                    }
                },
            }


    },

}
