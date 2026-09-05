local treesitter = require("plugins.treesitter")

treesitter.setup_update_hook()

require("vim-pack").add({
	{
		src = "nvim-treesitter/nvim-treesitter",
		version = "main",
		setup = false,
		on_setup = treesitter.setup,
	},
})
