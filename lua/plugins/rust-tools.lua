return {
    "simrat39/rust-tools.nvim", -- mejor soprte con rust
    config = function(_, opts)
        require("rust-tools").setup({
            tools = {
                inlay_hints = {
                    auto = false,
                },
            },
        })
    end,
}
