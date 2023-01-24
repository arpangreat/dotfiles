local wezterm = require("wezterm")
return {
	--[[ font = wezterm.font("Fira Code Retina", { weight = "Regular", italic = false }),
	font = wezterm.font("Fira Code", { weight = "Regular", italic = true }),
	font = wezterm.font("Fira Code", { weight = "Bold", italic = false }), ]]
	-- font = wezterm.font("Delugia", { weight = "Regular", style = "Normal" }),
	-- font = wezterm.font("Delugia", { weight = "Regular", style = "Italic" }),
	-- font = wezterm.font("Delugia", { weight = "Bold" }),
	-- font = wezterm.font("Delugia", { weight = "Bold", style = "Italic" }),
	-- font = wezterm.font("Comic Code Ligatures", { weight = "Regular", style = "Normal" }),
	-- font = wezterm.font("Comic Code Ligatures", { weight = "Regular", style = "Italic" }),
	-- font = wezterm.font("Comic Code Ligatures Bold", { style = "Normal" }),
	-- font = wezterm.font("Comic Code Ligatures Bold", { style = "Italic" }),
	italic = true,
	-- font = wezterm.font("MonoLisa", { weight = "Book", style = "Normal" }),
	-- font = wezterm.font("MonoLisa", { weight = "Book", style = "Italic" }),
	-- font = wezterm.font("MonoLisa", { weight = "Bold", style = "Normal" }),
	-- font = wezterm.font("MonoLisa", { weight = "Bold", style = "Italic" }),
	-- font_features CascadiaCode-Italic +calt +ss01 +ss02 +ss03 +ss04 +ss05 +ss07 +ss08 +ss19 +ss20 +zero +onum
	font = wezterm.font("Cascadia Code", { weight = "Regular", style = "Normal" }),
	font = wezterm.font("Cascadia Code", { weight = "Regular", style = "Italic" }),
	font = wezterm.font("Cascadia Code", { weight = "Bold", style = "Normal" }),
	font = wezterm.font("Cascadia Code", { weight = "Bold", style = "Italic" }),

	font_size = 13.5,
	color_scheme = "tokyonight_storm",
	color_scheme_dirs = { "/home/arpangreat/dotfiles/wezterm" },
	default_cursor_style = "SteadyBar",
	-- cursor_blink_rate = 500,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.75,
	window_padding = {
		left = "0.5cell",
		right = "0.0cell",
		top = "0.8cell",
		bottom = "0.0cell",
	},
	window_decorations = "NONE",
}
