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
				formatting.autopep8,
				formatting.prettier,
				diagnostics.flake8.with({
					extra_args = { "--extend-ignore=E501,E701,E702,E302,E305" },
				})
			},
			autostart = true,
		})
	end
}
