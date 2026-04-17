vim.lsp.config("docker_compose_language_service", {
	cmd = { "docker-compose-langserver", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose" },
	root_markers = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
})
