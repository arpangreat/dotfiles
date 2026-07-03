require("vim-pack").add({
	{
		src = "mason-org/mason.nvim",
		setup = false,
		on_setup = require("plugins.mason").setup,
	},
})
