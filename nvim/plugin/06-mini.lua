require("vim-pack").add({
	{ src = "nvim-mini/mini.icons", setup = false },
	{
		src = "nvim-mini/mini.hipatterns",
		setup = false,
		on_setup = require("plugins.mini").setup,
	},
	{
		src = "echasnovski/mini.diff",
		setup = false,
		on_setup = require("plugins.gitsigns").setup,
	},
})
