return {
    "williamboman/mason-lspconfig.nvim",
    dependencies={
        {"neovim/nvim-lspconfig"},
   	    {"williamboman/mason.nvim"}, 
        {"williamboman/mason-lspconfig.nvim"},
    },
    config = function()
      require("config.plugins.lspconfig")
    end,
}