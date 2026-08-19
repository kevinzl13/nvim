-- instalar el lsp de https://github.com/owenrumney/make-ls
-- go install github.com/owenrumney/make-ls/cmd/make-ls@latest

vim.lsp.start({
	name = "make-ls",
	cmd = { vim.fn.expand("~/go/bin/make-ls") },
	root_dir = vim.fs.root(0, { "Makefile", "makefile", "GNUmakefile" }),
})
