-- autocmds and keymaps can wait to load
vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
   pattern = "VeryLazy",
    callback = function()
      require "kevinzl.settings.keymaps"
      require "kevinzl.settings.options"
    end,
 })

require("kevinzl.settings.lazy")
