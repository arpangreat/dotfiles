local config = {
	options = {
		-- theme = "catppuccin",
		theme = "onedark_vivid",
		refresh = {
			statusline = nil,
		},
	},
	sections = {
		lualine_c = { "filename", { "buffers", mode = 2 } },
		lualine_x = {
			{
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
				color = { fg = "#ff9e64" },
			},
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
