local wezterm = require("wezterm")
return {
	--[[ font = wezterm.font("Fira Code Retina", { weight = "Regular", italic = false }),
	font = wezterm.font("Fira Code", { weight = "Regular", italic = true }),
	font = wezterm.font("Fira Code", { weight = "Bold", italic = false }), ]]
	font = wezterm.font("Delugia", { weight = "Regular", style = "Normal" }),
	font = wezterm.font("Delugia", { weight = "Regular", style = "Italic" }),
	font = wezterm.font("Delugia", { weight = "Bold" }),
	-- font = wezterm.font("Delugia", { weight = "Bold", style = "Italic" }),
	font_size = 14.8,
	color_scheme = "Catppuccin",
	color_scheme_dirs = { "/home/arpangreat/dotfiles/wezterm" },
	default_cursor_style = "SteadyBar",
	-- cursor_blink_rate = 500,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.8,
}
