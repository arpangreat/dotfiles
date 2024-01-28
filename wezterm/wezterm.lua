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

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- config.font = wezterm.font({ family = "Cascadia Code PL" })
-- font = wezterm.font({ family = "Monaspace Neon" }),
-- font = wezterm.font({ family = "Comic Code Ligatures" }),
config.font = wezterm.font({ family = "JetBrains Mono" })

-- config.font_rules = {
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
-- }

-- font_rules = {
-- 	{
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font("Comic Code Ligatures", { weight = "Bold", style = "Normal" }),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font("Comic Code Ligatures", { weight = "Bold", style = "Italic" }),
-- 	},
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font({ family = "Comic Code Ligatures", weight = "Regular", style = "Italic" }),
-- 	},
-- },

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

config.font_rules = {
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font({ family = "JetBrains Mono", weight = "Bold", style = "Normal" }),
  },
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font({ family = "JetBrains Mono", weight = "Bold", style = "Italic" }),
  },
  {
    intensity = "Normal",
    italic = true,
    font = wezterm.font({ family = "JetBrains Mono", weight = "Regular", style = "Italic" }),
  },
}

-- CascadiaCode
-- config.harfbuzz_features = {
-- 	"ss01",
-- 	"ss02",
-- 	"ss03",
-- 	"ss19",
-- 	"ss20",
-- 	"zero",
-- 	"onum",
-- 	"calt",
-- }

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

-- JetBrains Mono
config.harfbuzz_features = {
  "ss02",
  "zero",
  "cv03",
  "cv04",
  "cv05",
  "cv06",
  "cv11",
  "cv12",
  "cv14",
  "cv15",
  "cv17",
  "cv18",
  "cv99",
  "onum",
  "calt",
}

config.font_size = 11.0
config.color_scheme = "tokyonight_storm"
-- config.color_scheme = "Catppuccin"
-- config.color_scheme = "solarized_osaka"
-- color_scheme = "Horizon Dark (Gogh)",
config.color_scheme_dirs = { "/home/arpangreat/dotfiles/wezterm" }
-- colors = {
-- 	ansi = ansi,
-- 	brights = brights,
-- },
config.force_reverse_video_cursor = true
config.default_cursor_style = "SteadyBar"
-- cursor_blink_rate = 500,
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.90
config.text_background_opacity = 1.0
config.window_padding = {
  left = "0.5cell",
  right = "0.0cell",
  top = "0.0cell",
  bottom = "0.0cell",
}
config.enable_kitty_keyboard = true
config.window_decorations = "NONE"
config.term = "wezterm"
config.front_end = "OpenGL"
config.enable_wayland = false
config.alternate_buffer_wheel_scroll_speed = 1
config.animation_fps = 40

return config
