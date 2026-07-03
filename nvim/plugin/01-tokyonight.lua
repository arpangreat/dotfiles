require("vim-pack").add({
	{
		src = "folke/tokyonight.nvim",
		setup = false,
		on_setup = require("plugins.tokyonight").setup,
	},
})
