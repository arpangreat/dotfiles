require("vim-pack").add({
	{
		src = "stevearc/conform.nvim",
		setup = false,
		on_setup = require("plugins.conform").setup,
	},
})
