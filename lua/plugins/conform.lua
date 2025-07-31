return {
    "stevearc/conform.nvim",
	event = { "BufReadPre" },
    opts = function () 
        return require("plugins.configs.formating")
    end,
    config = function (_, opts) 
        require("conform").setup(opts)
    end,
}
