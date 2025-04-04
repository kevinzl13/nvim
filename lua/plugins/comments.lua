return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
        local keymaps = require("core.keymaps")

        require("Comment").setup({
            toggler = {
                line = keymaps.comment.toggler.line, -- gcc
                block = keymaps.comment.toggler.block, -- gbc
            },
            opleader = {
                line = keymaps.comment.opleader.line, -- gc
                block = keymaps.comment.opleader.block, -- gb
            },
            extra = {
                above = keymaps.comment.extra.above, -- gcO
                below = keymaps.comment.extra.below, -- gco
                eol = keymaps.comment.extra.eol, -- gcA
            },
        })
    end,
}
