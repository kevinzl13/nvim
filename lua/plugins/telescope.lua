return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    -- Cargar keymaps
    local keymaps = require("core.keymaps")

    -- Cargar telescope.actions
    local actions = require("telescope.actions")

    -- Configuración de Telescope
    require("telescope").setup({
      defaults = {
        mappings = {
          i = keymaps.telescope_keymaps.insert_key(actions), -- Pasar actions como argumento
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    -- Aplicar keymaps normales
    for _, mapping in ipairs(keymaps.telescope_keymaps.normal) do
      vim.api.nvim_set_keymap(
        mapping.mode,
        mapping.key,
        "<cmd>Telescope " .. mapping.action .. "<CR>",
        mapping.opts
      )
    end

    -- Cargar extensiones de Telescope
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("ui-select")
  end,
}

