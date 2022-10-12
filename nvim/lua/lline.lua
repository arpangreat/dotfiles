local config = {
	options = {
		theme = "catppuccin",
		refresh = {
			statusline = nil,
		},
	},
	sections = {
		lualine_c = { "filename", { "buffers", mode = 2 } },
		lualine_x = {
			{ "lsp_progress", display_components = { "lsp_client_name" } },
			"encoding",
			"fileformat",
			"filetype",
		},
	},
	tabline = {
		lualine_z = { {
			"tabs",
			mode = 2,
		} },
	},
}

require("lualine").setup(config)
