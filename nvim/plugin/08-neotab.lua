require("vim-pack").add({
	{
		src = "kawre/neotab.nvim",
		setup = false,
		on_setup = require("plugins.neotab").setup,
	},
})
