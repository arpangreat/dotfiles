local gps = require("nvim-gps")

require("lualine").setup({
	options = { theme = require("lualine.themes.terafox") },
	-- options = { theme = "catppuccin" },
	-- options = { theme = "tokyonight" },
	sections = {
		lualine_c = {
			{ "filename" },
			{ gps.get_location, cond = gps.is_available },
		},
	},
})
