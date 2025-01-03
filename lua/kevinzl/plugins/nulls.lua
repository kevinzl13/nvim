return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local null_ls_status_ok, null_ls = pcall(require, "null-ls")
        if not null_ls_status_ok then
            return
        end

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics


        null_ls.setup({
            sources = {
                formatting.autopep8.with({
                    extra_args = { "--indent-size=4" }
                }),
                formatting.prettier.with({
                    extra_args = { "--tab-width", "4", "--print-width", "70" },
                }),
                diagnostics.flake8.with({
                    extra_args = { "--extend-ignore=E501,E701,E702,E302,E305,W391" },
                }),
                formatting.clang_format.with({
                    extra_args = {
                        "--style={BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never}"
                    },
                })
            },
            autostart = true,
        })
    end
}
