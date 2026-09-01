require("vim-pack").add({
	{
		src = "christoomey/vim-tmux-navigator",
		setup = false,
		on_setup = function()
			require("plugins.tmux").setup()
		end,
	},
})
