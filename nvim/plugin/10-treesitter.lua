require("vim-pack").add({
	{
		src = "nvim-treesitter/nvim-treesitter",
		version = "main",
		setup = false,
		on_setup = require("plugins.treesitter").setup,
	},
})
