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
	-- font = wezterm.font({ family = "Cascadia Code PL" }),
	-- font = wezterm.font({ family = "Monaspace Neon" }),
	-- font = wezterm.font({ family = "Maple Mono" }),
	font = wezterm.font({ family = "Comic Code Ligatures" }),

	-- font_rules = {
	--   {
	--     intensity = "Bold",
	--     italic = false,
	--     font = wezterm.font("Cascadia Code PL", { weight = "Bold", style = "Normal" }),
	--   },
	--   {
	--     intensity = "Bold",
	--     italic = true,
	--     font = wezterm.font("Cascadia Code PL", { weight = "Bold", style = "Italic" }),
	--   },
	--   {
	--     intensity = "Normal",
	--     italic = true,
	--     font = wezterm.font({ family = "Cascadia Code PL", weight = "Regular", style = "Italic" }),
	--   },
	-- },

	font_rules = {
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font("Comic Code Ligatures", { weight = "Bold", style = "Normal" }),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font("Comic Code Ligatures", { weight = "Bold", style = "Italic" }),
		},
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font({ family = "Comic Code Ligatures", weight = "Regular", style = "Italic" }),
		},
	},

	-- font_rules = {
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = false,
	-- 		font = wezterm.font("Monaspace Neon", { weight = "Bold", style = "Normal" }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font("Monaspace Radon", { weight = "Bold", style = "Normal" }),
	-- 	},
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = true,
	-- 		font = wezterm.font({ family = "Monaspace Radon", weight = "Regular", style = "Normal" }),
	-- 	},
	-- 	{
	-- 		intensity = "Half",
	-- 		italic = true,
	-- 		font = wezterm.font({ family = "Monaspace Radon", weight = "Light", style = "Normal" }),
	-- 	},
	-- 	{
	-- 		intensity = "Half",
	-- 		italic = false,
	-- 		font = wezterm.font({ family = "Monaspace Neon", weight = "Light", style = "Normal" }),
	-- 	},
	-- 	{
	-- 		intensity = "Half",
	-- 		italic = false,
	-- 		font = wezterm.font({ family = "Monaspace Neon", weight = "Bold", style = "Normal" }),
	-- 	},
	-- },

	-- CascadiaCode
	-- harfbuzz_features = {
	-- 	"ss01",
	-- 	"ss02",
	-- 	"ss03",
	-- 	"ss19",
	-- 	"ss20",
	-- 	"zero",
	-- 	"onum",
	-- 	"calt",
	-- },

	-- Monaspace
	-- harfbuzz_features = {
	-- 	"ss01",
	-- 	"ss02",
	-- 	"ss03",
	-- 	"ss04",
	-- 	"ss05",
	-- 	"ss06",
	-- 	"ss07",
	-- 	"ss08",
	-- 	"calt",
	-- 	"zero",
	-- 	"dlig",
	-- },

	-- Maple
	-- harfbuzz_features = {
	-- 	"cv02",
	-- 	"cv04",
	-- 	"ss01",
	-- 	"ss02",
	-- 	"ss03",
	-- 	"ss04",
	-- 	"ss05",
	-- },

	font_size = 10.5,
	-- color_scheme = "tokyonight_storm",
	color_scheme = "solarized_osaka",
	-- color_scheme = "Horizon Dark (Gogh)",
	color_scheme_dirs = { "/home/arpangreat/dotfiles/wezterm" },
	-- colors = {
	-- 	ansi = ansi,
	-- 	brights = brights,
	-- },
	force_reverse_video_cursor = true,
	default_cursor_style = "SteadyBar",
	-- cursor_blink_rate = 500,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.75,
	text_background_opacity = 0.8,
	window_padding = {
		left = "0.5cell",
		right = "0.0cell",
		top = "0.0cell",
		bottom = "0.0cell",
	},
	window_decorations = "NONE",
	term = "wezterm",
	front_end = "OpenGL",
	enable_wayland = false,
	alternate_buffer_wheel_scroll_speed = 1,
	animation_fps = 40,
}
