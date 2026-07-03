require("vim-pack").add({
	{
		src = "folke/trouble.nvim",
		setup = false,
		on_setup = require("plugins.trouble").setup,
	},
})
