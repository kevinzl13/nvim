return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = function()
      return require "config.plugins.telescope"
    end
    --function(_,opts)
--	    require("telescope").setup(opts)
  --  end
}