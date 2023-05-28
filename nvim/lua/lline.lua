local config = {
	options = {
		-- theme = "catppuccin",
		-- theme = "onedark_vivid",
		-- theme = "tokyonight",
		-- theme = "carbonfox",
		-- theme = "material",
		theme = "themer",
		refresh = {
			statusline = nil,
		},
	},
	sections = {
		lualine_c = { "filename", { "buffers", mode = 2 } },
		lualine_x = {
			{
				require("noice").api.status.message.get_hl,
				cond = require("noice").api.status.message.has,
			},
			{
				require("noice").api.status.command.get,
				cond = require("noice").api.status.command.has,
				color = { fg = "#ff9e64" },
			},
			{
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
				color = { fg = "#ff9e64" },
			},
			{
				require("noice").api.status.search.get,
				cond = require("noice").api.status.search.has,
				color = { fg = "#ff9e64" },
			},
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
