require("vim-pack").add({
	{ src = "ibhagwan/fzf-lua", setup = false },
	{
		src = "roginfarrer/fzf-lua-lazy.nvim",
		setup = false,
		on_setup = require("plugins.fzflazy").setup,
	},
})
