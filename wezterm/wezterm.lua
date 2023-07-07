local wezterm = require("wezterm")

local colors = wezterm.color.extract_colors_from_image("/home/arpangreat/dotfiles/wallpaper/wallpaper-demon-girl.jpg")
local ansi = {}
local brights = {}

for idx, color in ipairs(colors) do
	if idx <= 8 then
		ansi[idx] = color
	else
		brights[idx - 8] = color
	end
end

return {
	--[[ font = wezterm.font("Fira Code Retina", { weight = "Regular", italic = false }),
	font = wezterm.font("Fira Code", { weight = "Regular", italic = true }),
	font = wezterm.font("Fira Code", { weight = "Bold", italic = false }), ]]
	-- font = wezterm.font("Delugia", { weight = "Regular", style = "Normal" }),
	-- font = wezterm.font("Delugia", { weight = "Regular", style = "Italic" }),
	-- font = wezterm.font("Delugia", { weight = "Bold" }),
	-- font = wezterm.font("Delugia", { weight = "Bold", style = "Italic" }),
font = wezterm.font("Comic Code Ligatures", { weight = "Regular", style = "Normal" }),
font = wezterm.font("Comic Code Ligatures", { weight = "Regular", style = "Italic" }),
font = wezterm.font("Comic Code Ligatures Bold", { style = "Normal" }),
font = wezterm.font("Comic Code Ligatures Bold", { style = "Italic" }),
	-- font = wezterm.font("SFMono Nerd Font", { weight = "Regular" }),
	-- font = wezterm.font("SFMono Nerd Font", { weight = "Regular", style = "Italic" }),
	-- font = wezterm.font("SFMono Nerd Font", { weight = "Bold" }),
	-- font = wezterm.font("SFMono Nerd Font", { weight = "Bold", style = "Italic" }),
	-- font = wezterm.font("MonoLisa", { weight = "Book", style = "Normal" }),
	-- font = wezterm.font("MonoLisa", { weight = "Book", style = "Italic" }),
	-- font = wezterm.font("MonoLisa", { weight = "Bold", style = "Normal" }),
	-- font = wezterm.font("MonoLisa", { weight = "Bold", style = "Italic" }),
	-- font_features CascadiaCode-Italic +calt +ss01 +ss02 +ss03 +ss04 +ss05 +ss07 +ss08 +ss19 +ss20 +zero +onum
	-- font = wezterm.font("Cascadia Code", { weight = "Regular", style = "Normal" }),
	-- font = wezterm.font("Cascadia Code", { weight = "Regular", style = "Italic" }),
	-- font = wezterm.font("Cascadia Code", { weight = "Bold", style = "Normal" }),
	-- font = wezterm.font("Cascadia Code", { weight = "Bold", style = "Italic" }),

	--[[ harfbuzz_features = {
		"calt=0",
		"ss01=0",
		"ss02=0",
		"ss03=0",
		"ss04=0",
		"ss05=0",
		"ss07=0",
		"ss08=0",
		"ss19=0",
		"ss20=0",
		"zero",
		"onum",
		"liga",
	}, ]]

	-- font = wezterm.font("Iosevka SS18", { weight = "Regular", stretch = "Normal", style = "Normal" }),
	-- font = wezterm.font("Iosevka SS18", { weight = "Regular", stretch = "Normal", style = "Italic" }),
	-- font = wezterm.font("Iosevka SS18", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	-- font = wezterm.font("Iosevka SS18", { weight = "Bold", stretch = "Normal", style = "Italic" }),

--[[ harfbuzz_features = {
	"calt",
	"liga",
	"dlig",
	"frac",
	"ordn",
	"subs",
	"sups",
},]]

	font_size = 11.0,
	color_scheme = "Catppuccin",
	color_scheme_dirs = { "/home/arpangreat/dotfiles/wezterm" },
	-- colors = {
	-- 	ansi = ansi,
	-- 	brights = brights,
	-- },
	force_reverse_video_cursor = true,
	default_cursor_style = "SteadyBar",
	-- cursor_blink_rate = 500,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.5,
	window_padding = {
		left = "0.5cell",
		right = "0.0cell",
		top = "0.0cell",
		bottom = "0.0cell",
	},
	window_decorations = "NONE",
}
