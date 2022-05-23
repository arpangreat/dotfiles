local gps = require("nvim-gps")

require("lualine").setup({
	-- options = { theme = require("lualine.themes.terafox") },
	options = { theme = require("lualine.themes.nordfox") },
	-- options = { theme = "gruvbox-material" },
	-- options = { theme = "catppuccin" },
	-- options = { theme = "tokyonight" },
	sections = {
		lualine_c = {
			{ "filename" },
			-- { gps.get_location, cond = gps.is_available },
		},
	},
})

_G.gps_location = function()
	return gps.is_available() and gps.get_location() or ""
end
vim.opt.winbar = "%{%v:lua.gps_location()%}"

vim.api.nvim_create_autocmd("CursorMoved", {
	pattern = "*",
	command = "set winbar=%{%v:lua.gps_location()%}",
})
