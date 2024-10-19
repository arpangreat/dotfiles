local wezterm = require("wezterm")

local colors = wezterm.color.extract_colors_from_image("/home/arpangreat/dotfiles/wallpaper/wallpaper-demon-girl.jpg")
local gpus = wezterm.gui.enumerate_gpus()
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

-- function recompute_padding(window)
-- 	local window_dims = window:get_dimensions()
-- 	local overrides = window:get_config_overrides() or {}

-- 	if not window_dims.is_full_screen then
-- 		if not overrides.window_padding then
-- 			-- not changing anything
-- 			return
-- 		end
-- 		overrides.window_padding = nil
-- 	else
-- 		-- Use only the middle 33%
-- 		local third = math.floor(window_dims.pixel_width / 3)
-- 		local new_padding = {
-- 			left = third,
-- 			right = third,
-- 			top = 0,
-- 			bottom = 0,
-- 		}
-- 		if overrides.window_padding and new_padding.left == overrides.window_padding.left then
-- 			-- padding is same, avoid triggering further changes
-- 			return
-- 		end
-- 		overrides.window_padding = new_padding
-- 	end
-- 	window:set_config_overrides(overrides)
-- end

-- wezterm.on("window-resized", function(window, pane)
-- 	recompute_padding(window)
-- end)

-- wezterm.on("window-config-reloaded", function(window)
-- 	recompute_padding(window)
-- end)
config.font = wezterm.font({ family = "Cascadia Code PL" })
-- config.font = wezterm.font({ family = "Monaspace Argon" })
-- config.font = wezterm.font({ family = "Maple Mono NF" })
-- config.font = wezterm.font({ family = "JetBrains Mono" })
-- config.font = wezterm.font({ family = "JuliaMono" })
-- config.font = wezterm.font({ family = "Rec Mono Duotone" })
-- config.font = wezterm.font({ family = "MonoLisa"})

config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("Cascadia Code PL", { weight = "Bold", style = "Normal" }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("Cascadia Code PL", { weight = "Bold", style = "Italic" }),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({ family = "Cascadia Code PL", weight = "Regular", style = "Italic" }),
	},
}

-- config.font_rules = {
-- 	{
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font("Maple Mono NF", { weight = "Bold", style = "Normal" }),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font("Maple Mono NF", { weight = "Bold", style = "Italic" }),
-- 	},
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font({ family = "Maple Mono NF", weight = "Regular", style = "Italic" }),
-- 	},
-- }

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

--[[ config.font_rules = {
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
} ]]

-- config.font_rules = {
--   {
--     intensity = "Bold",
--     italic = false,
--     font = wezterm.font("MonoLisa", { weight = "Bold", style = "Normal" }),
--   },
--   {
--     intensity = "Bold",
--     italic = true,
--     font = wezterm.font("MonoLisa", { weight = "Bold", style = "Italic" }),
--   },
--   {
--     intensity = "Normal",
--     italic = true,
--     font = wezterm.font({ family = "MonoLisa", weight = "Regular", style = "Italic" }),
--   },
-- }

-- CascadiaCode
config.harfbuzz_features = {
	"ss01",
	"ss02",
	"ss03",
	"ss20",
	"calt",
}

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

-- config.harfbuzz_features = {
-- 	"calt",
-- 	"dlig",
-- 	"zero",
-- 	"locl",
-- 	"cv02",
-- 	"cv03",
-- 	"cv31",
-- }

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
-- config.freetype_load_target = "Normal"
-- config.freetype_render_target = "Light"
-- config.freetype_load_flags = "DEFAULT"
config.color_scheme = "tokyonight_storm"
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "solarized_osaka"
-- color_scheme = "Horizon Dark (Gogh)",
config.color_scheme_dirs = { "/home/arpangreat/dotfiles/wezterm" }
-- colors = {
-- 	ansi = ansi,
-- 	brights = brights,
-- },
config.max_fps = 255
config.force_reverse_video_cursor = true
config.default_cursor_style = "SteadyBar"
-- cursor_blink_rate = 500,
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.90
config.text_background_opacity = 1.0
config.window_padding = {
	left = "0.0cell",
	right = "0.0cell",
	top = "0.4cell",
	bottom = "0.0cell",
}
config.enable_kitty_keyboard = true
config.window_decorations = "NONE"
config.term = "wezterm"
config.front_end = "WebGpu"
-- config.webgpu_preferred_adapter = gpus[2]
config.enable_wayland = false
config.alternate_buffer_wheel_scroll_speed = 1
config.animation_fps = 60

return config
