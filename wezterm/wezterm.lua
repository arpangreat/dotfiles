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
	-- font = wezterm.font({ family = "MonoLisa" }),
	-- font = wezterm.font({ family = "JetBrains Mono" }),
	-- font = wezterm.font({ family = "Iosevka SS18", weight = "Black" }),
	font = wezterm.font({ family = "Monaspace Neon" }),

	-- font_rules = {
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = false,
	-- 		font = wezterm.font("Cascadia Code PL", { weight = "Bold", style = "Normal" }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font("Cascadia Code PL", { weight = "Bold", style = "Italic" }),
	-- 	},
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = true,
	-- 		font = wezterm.font({ family = "Cascadia Code PL", weight = "Regular", style = "Italic" }),
	-- 	},
	-- },

	font_rules = {
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font("Monaspace Neon", { weight = "Bold", style = "Normal" }),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font("Monaspace Radon", { weight = "Bold", style = "Normal" }),
		},
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font({ family = "Monaspace Radon", weight = "Regular", style = "Normal" }),
		},
		{
			intensity = "Half",
			italic = true,
			font = wezterm.font({ family = "Monaspace Radon", weight = "Light", style = "Normal" }),
		},
		{
			intensity = "Half",
			italic = false,
			font = wezterm.font({ family = "Monaspace Neon", weight = "Light", style = "Normal" }),
		},
		{
			intensity = "Half",
			italic = false,
			font = wezterm.font({ family = "Monaspace Neon", weight = "Bold", style = "Normal" }),
		},
	},
	-- font_rules = {
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = false,
	-- 		font = wezterm.font("Iosevka SS18", { weight = "Bold", style = "Normal", stretch = "Expanded" }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font("Iosevka SS18", { weight = "Bold", style = "Italic", stretch = "Expanded" }),
	-- 	},
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = true,
	-- 		font = wezterm.font({ family = "Iosevka SS18", weight = "Black", style = "Italic" }),
	-- 	},
	-- },
	-- font_rules = {
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = false,
	-- 		font = wezterm.font("MonoLisa", { weight = "Bold", style = "Normal" }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font("MonoLisa", { weight = "Bold", style = "Italic" }),
	-- 	},
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = true,
	-- 		font = wezterm.font({ family = "MonoLisa", weight = "Regular", style = "Italic" }),
	-- 	},
	-- },

	-- font_rules = {
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = false,
	-- 		font = wezterm.font("JetBrains Mono", { weight = "Bold", style = "Normal" }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font("JetBrains Mono", { weight = "Bold", style = "Italic" }),
	-- 	},
	-- 	{
	-- 		intensity = "Normal",
	-- 		italic = true,
	-- 		font = wezterm.font({ family = "JetBrains Mono", weight = "Regular", style = "Italic" }),
	-- 	},
	-- },

	-- MonoLisa
	-- harfbuzz_features = {
	-- 	"ss01",
	-- 	"ss02",
	-- 	"ss03",
	-- 	"ss04",
	-- 	"ss05",
	-- 	"ss07",
	-- 	"ss08",
	-- 	"ss10",
	-- 	"ss11",
	-- 	"ss11",
	-- 	"ss19",
	-- 	"ss20",
	-- 	"zero",
	-- 	"liga",
	-- 	"calt",
	-- 	"frac",
	-- },
	--
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
	harfbuzz_features = {
		"ss01",
		"ss02",
		"ss03",
		"ss04",
		"ss05",
		"ss06",
		"ss07",
		"ss08",
		"calt",
		"zero",
		"dlig",
	},
	-- Iosevka
	-- harfbuzz_features = {
	-- 	"ss05",
	-- 	"cv77=40",
	-- 	"vxla=2",
	-- 	"vxlb=5",
	-- 	"vxle=2",
	-- 	"cv94=1",
	-- 	"cv90=9",
	-- 	"cv89=2",
	-- 	"cv88=2",
	-- 	"cv96=1",
	-- 	"cv83=49",
	-- },

	-- Fira code
	-- harfbuzz_features = {
	-- 	"+zero",
	-- 	"+ss01",
	-- 	"+ss03",
	-- 	"+ss04",
	-- 	"+ss05",
	-- 	"+ss06",
	-- 	"+ss07",
	-- 	"+ss09",
	-- 	"+ss10",
	-- 	"+cv01",
	-- 	"+cv02",
	-- 	"+cv05",
	-- 	"+cv09",
	-- 	"+cv13",
	-- 	"+cv14",
	-- 	"+cv16",
	-- 	"+cv18",
	-- 	"+cv22",
	-- 	"+cv24",
	-- 	"+cv25",
	-- 	"+cv26",
	-- 	"+cv32",
	-- 	"+cv27",
	-- 	"+cv28",
	-- 	"+cv31",
	-- 	"+cv29",
	-- 	"+ss02",
	-- },

	-- harfbuzz_features = {
	-- 	"calt",
	-- 	"zero",
	-- 	"ss01",
	-- 	"ss02",
	-- 	"ss20",
	-- },

	font_size = 11,
	color_scheme = "tokyonight_storm",
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
}
