require("vim-pack").add({
	{
		src = "christoomey/vim-tmux-navigator",
		setup = false,
		on_setup = require("plugins.tmux").setup,
	},
})
