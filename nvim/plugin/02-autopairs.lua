require("vim-pack").add({
	{
		src = "windwp/nvim-autopairs",
		setup = false,
		on_setup = require("plugins.autopairs").setup,
	},
})
