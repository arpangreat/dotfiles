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
	-- font = wezterm.font("Comic Code Ligatures", { weight = "Regular", style = "Normal" }),
	-- font = wezterm.font("Comic Code Ligatures", { weight = "Regular", style = "Italic" }),
	-- font = wezterm.font("Comic Code Ligatures Bold", { style = "Normal" }),
	-- font = wezterm.font("Comic Code Ligatures Bold", { style = "Italic" }),

	-- font = wezterm.font("Iosevka SS05", {weight="Black", stretch="Expanded", style="Italic"}),
	-- font = wezterm.font("Iosevka SS05", {weight="Black", stretch="Expanded", style="Italic"}),
	-- font = wezterm.font("Iosevka SS05", {weight="Bold", stretch="Expanded", style="Normal"}),
	-- font = wezterm.font("Iosevka SS05", {weight="Bold", stretch="Expanded", style="Italic"}),

	font = wezterm.font("Fira Code", { weight = "Regular", stretch = "Normal", style = "Normal" }), -- /usr/share/fonts/TTF/FiraCode-Regular.ttf, FontConfig
	font = wezterm.font("Fira Code", { weight = "Regular", stretch = "Normal", style = "Italic" }), -- /usr/share/fonts/OTF/FiraCode-RegularItalic.otf, FontConfig
	font = wezterm.font("Fira Code", { weight = "Bold", stretch = "Normal", style = "Normal" }), -- /usr/share/fonts/TTF/FiraCode-Bold.ttf, FontConfig
	font = wezterm.font("Fira Code", { weight = "Bold", stretch = "Normal", style = "Italic" }),

	-- font = wezterm.font("PragmataPro Liga", {weight="Regular", stretch="Normal", style="Normal"}),
	-- font = wezterm.font("PragmataPro Liga", {weight="Regular", stretch="Normal", style="Italic"}),
	-- font = wezterm.font("PragmataPro Liga", {weight="Bold", stretch="Normal", style="Normal"}),
	-- font = wezterm.font("PragmataPro Liga", {weight="Bold", stretch="Normal", style="Italic"}),
	--font = wezterm.font("SFMono Nerd Font", { weight = "Regular", style = "Italic" }),
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

	-- harfbuzz_features = {
	-- 	"ss05=0",
	-- 	"+cv77=40",
	-- 	 "+vxla=2",
	-- 	 "+vxlb=5",
	-- 	 "+vxle=2",
	-- 	"+cv94=1",
	-- 	 "+cv90=9",
	-- 	 "v89=2",
	-- 	 "+cv88=2",
	-- 	 "+cv96=1",
	-- },

	harfbuzz_features = {
		"+zero",
		"+ss01",
		"+ss03",
		"+ss04",
		"+ss05",
		"+ss06",
		"+ss07",
		"+ss09",
		"+ss10",
		"+cv01",
		"+cv02",
		"+cv05",
		"+cv09",
		"+cv13",
		"+cv14",
		"+cv16",
		"+cv18",
		"+cv22",
		"+cv24",
		"+cv25",
		"+cv26",
		"+cv32",
		"+cv27",
		"+cv28",
		"+cv31",
		"+cv29",
		"+ss02",
	},

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
