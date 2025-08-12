local M = {}

-- Colores base (puedes ajustarlos según tu tema)
M.colors = {
	gray = "#A0A8B7",
	orange = "#FFB86C",
	pink = "#FF79C6",
	blue = "#8BE9FD",
	green = "#50FA7B",
	yellow = "#F1FA8C",
	beige = "#D1C8B5",
	purple = "#BD93F9",
	red = "#FF5555",
	bg_dark = "#1E1F29",
	bg_light = "#282A36",
}

-- Configuración de highlights para nvim-cmp
function M.setup_cmp_highlights()
	local colors = M.colors

	-- Texto general y coincidencias
	vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = colors.gray })
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.orange, bold = true })
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = colors.orange, bold = true })
	vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = colors.pink })

	-- Colores por tipo de elemento
	vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = colors.pink })
	vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = colors.orange })
	vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = colors.green })
	vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = colors.green })
	vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = colors.beige })
	vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = colors.pink })
	vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = colors.purple })
	vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = colors.red })

	-- Estilo del menú
	vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg_dark, fg = colors.gray })
	vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.orange, fg = colors.bg_light, bold = true })
	vim.api.nvim_set_hl(0, "CmpItemSelected", { bg = colors.orange, fg = colors.bg_light, bold = true })
end

return M

