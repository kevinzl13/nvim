local colortheme = "everforest"

vim.cmd("set background=dark")



return {
  {
      "oxfist/night-owl.nvim",
      lazy = false,
      priority = 1000,
      config = function()
      vim.cmd.colorscheme(colortheme)
    -- Aplica la configuración adicional del tema si está presente
    end,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd.colorscheme(colortheme)
    end,
  }
}
