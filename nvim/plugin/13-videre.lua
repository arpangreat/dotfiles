require("vim-pack").add({
	{
		src = "Owen-Dechow/videre.nvim",
		setup = false,
		on_setup = require("plugins.videre").setup,
	},
	{
		src = "Owen-Dechow/graph_view_yaml_parser", -- Optional: add YAML support
		setup = false,
	},
	{
		src = "Owen-Dechow/graph_view_toml_parser", -- Optional: add TOML support
		setup = false,
	},
})
