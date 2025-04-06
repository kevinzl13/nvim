return {
	"chrisgrieser/nvim-rip-substitute",
	cmd = "RipSubstitute",
	opts = {},
	config = function()
		require("rip-substitute").setup({
			popupWin = {
				title = " rip-substitute",
				border = "rounded", -- Usa borde redondeado directamente
				position = "bottom",
				hideSearchReplaceLabels = false,
				hideKeymapHints = true, -- Desactiva hints para mayor limpieza
			},
			prefill = {
				normal = "cursorWord",
				visual = false, -- Desactiva prefill en modo visual para mejor rendimiento
				startInReplaceLineIfPrefill = false,
				alsoPrefillReplaceLine = false,
			},
			keymaps = {
				abort = "q",
				toggleIgnoreCase = "<C-c>",
				confirm = "<CR>", -- Enter confirma y aplica TODOS los reemplazos
				insertModeConfirm = "<C-CR>", -- Enter en modo insertar también confirma
			},
			incrementalPreview = {
				matchHlGroup = "", -- Desactiva resaltado de coincidencias
				rangeBackdrop = {
					enabled = false, -- Desactiva el fondo difuminado (mejor rendimiento)
				},
				enabled = false,
			},
			regexOptions = {
				pcre2 = false, -- Desactiva PCRE2 (mejor rendimiento sin lookarounds)
				autoBraceSimpleCaptureGroups = false,
			},
			highlightMatches = false, -- ¡Clave para desactivar el resaltado global!
			notification = {
				onSuccess = false, -- Desactiva notificaciones
			},
		})
	end,
}
