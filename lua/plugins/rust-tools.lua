return {
    "simrat39/rust-tools.nvim", -- mejor soprte con rust
    config = function()
        require("rust-tools").setup({})
    end,
}
