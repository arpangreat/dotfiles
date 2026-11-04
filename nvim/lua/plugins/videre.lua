local M = {}

function M.setup()
	require("videre").setup({
		box_style = "sharp",
	})
end

M.specs = {
	{
		src = "Owen-Dechow/videre.nvim",
		setup = false,
		on_setup = M.setup,
	},
	{
		src = "Owen-Dechow/graph_view_yaml_parser", -- Optional: add YAML support
		setup = false,
	},
	{
		src = "Owen-Dechow/graph_view_toml_parser", -- Optional: add TOML support
		setup = false,
	},
}

return M
