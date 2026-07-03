require("vim-pack").add({
	{
		src = "folke/which-key.nvim",
		setup = false,
		on_setup = require("plugins.whichkey").setup,
	},
})
