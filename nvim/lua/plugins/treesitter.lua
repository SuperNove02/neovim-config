
return{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		local config = require("nvim-treesitter.configs")

		config.setup({
			ensure_installed = {"lua", "javascript", "go"},
      auto_install = true,
			highlight = { enabled = true},
			indent = {enabled = true},
		})
	end
}
