return {
	ensure_installed = { 
        "lua-language-server",
        'stylua',
        'rust-analyzer',
        'pyright',
        'clangd',
        "gopls",
    },

	max_concurrent_installers = 10,

}