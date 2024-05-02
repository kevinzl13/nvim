local treesitter_config = require("config.plugins.treesitter")

return {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = treesitter_config.config,
    },
  }