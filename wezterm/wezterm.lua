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
-- config.font = wezterm.font({ family = "Monaspace Argon" })
-- config.font = wezterm.font({ family = "Comic Code Ligatures" })
-- config.font = wezterm.font({ family = "JetBrains Mono" })
-- config.font = wezterm.font({ family = "JuliaMono" })
config.font = wezterm.font({ family = "Rec Mono Duotone" })

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

-- config.font_rules = {
-- 	{
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font("Monaspace Argon", { weight = "Bold", style = "Normal" }),
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
-- }

-- config.font_rules = {
-- 	{
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font({ family = "JetBrains Mono", weight = "Bold", style = "Normal" }),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font({ family = "JetBrains Mono", weight = "Bold", style = "Italic" }),
-- 	},
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font({ family = "JetBrains Mono", weight = "Regular", style = "Italic" }),
-- 	},
-- }

config.font_rules = {
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font("Rec Mono Duotone", { weight = "Bold", style = "Normal" }),
  },
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font("Rec Mono Duotone", { weight = "Bold", style = "Italic" }),
  },
  {
    intensity = "Normal",
    italic = true,
    font = wezterm.font({ family = "Rec Mono Duotone", weight = "Regular", style = "Italic" }),
  },
}

-- config.font_rules = {
--   {
--     intensity = "Bold",
--     italic = false,
--     font = wezterm.font("JuliaMono", { weight = "Bold", style = "Normal" }),
--   },
--   {
--     intensity = "Bold",
--     italic = true,
--     font = wezterm.font("JuliaMono", { weight = "Bold", style = "Italic" }),
--   },
--   {
--     intensity = "Normal",
--     italic = true,
--     font = wezterm.font({ family = "JuliaMono", weight = "Regular", style = "Italic" }),
--   },
-- }

-- CascadiaCode
-- config.harfbuzz_features = {
--   "ss01",
--   "ss02",
--   "ss03",
--   "ss19",
--   "ss20",
--   "zero",
--   "onum",
--   "calt",
-- }

-- Monaspace
-- config.harfbuzz_features = {
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
-- }

-- JetBrains Mono
-- config.harfbuzz_features = {
-- 	"ss02",
-- 	"zero",
-- 	"cv03",
-- 	"cv04",
-- 	"cv05",
-- 	"cv06",
-- 	"cv11",
-- 	"cv12",
-- 	"cv14",
-- 	"cv15",
-- 	"cv17",
-- 	"cv18",
-- 	"cv99",
-- 	"onum",
-- 	"calt",
-- }

config.harfbuzz_features = {
  "calt",
  "dlig",
  "zero",
  "ss01",
  "ss03",
  "ss05",
  "ss06",
  "ss07",
  "ss08",
  "ss09",
  "ss12",
}

-- JuliaMono
-- config.harfbuzz_features = {
--   "zero",
--   "calt",
--   "ss01",
--   "ss06",
--   "ss08",
--   "ss09",
--   "ss10",
--   "ss12",
--   "ss13",
--   "ss14",
--   "ss20",
--   "cv03",
-- }

config.hyperlink_rules = wezterm.default_hyperlink_rules()

table.insert(config.hyperlink_rules, {
  regex = [[\b[tt](\d+)\b]],
  format = "https://example.com/tasks/?t=$1",
})

table.insert(config.hyperlink_rules, {
  regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
  format = "https://www.github.com/$1/$3",
})

config.font_size = 11.0
config.freetype_load_target = "Normal"
config.freetype_render_target = "Normal"
config.freetype_load_flags = "DEFAULT"
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
config.window_background_opacity = 0.95
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
-- config.front_end = "WebGpu"
config.enable_wayland = false
config.alternate_buffer_wheel_scroll_speed = 1
config.animation_fps = 40

return config
