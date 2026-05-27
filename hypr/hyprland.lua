-- Hyprland 0.55+ Lua config converted from hyprland.conf.

local main_mod = "SUPER"

-- hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = "1" })
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@75", position = "auto", scale = "1" })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "1" })

hl.on("hyprland.start", function()
	for _, cmd in ipairs({
		"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
		"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
		"~/dotfiles/hypr/launch.sh",
		"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
		"systemctl --user start hyprpolkitagent",
		"hyprctl setcursor catppuccin-mocha-maroon-cursors 20",
		"wl-clip-persist --clipboard regular",
		"/usr/local/bin/pypr",
		"waybar",
		"swaybg -i ~/dotfiles/wallpaper/4k/lighthouse.jpg",
		"ghostty",
		"zen-browser",
		"swaync",
		"nm-applet",
		"systemctl --user restart elephant.service",
		"walker --gapplication-service",
		-- Re-apply config once devices and portals have settled.
		"sh -lc 'sleep 3 && hyprctl reload'",
	}) do
		hl.exec_cmd(cmd)
	end
end)

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("AQ_NO_MODIFIERS", "1")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", persistent = true, default = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", persistent = true, default = true })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", persistent = true, default = true })

hl.config({
	input = {
		kb_layout = "us",
		repeat_rate = 50,
		repeat_delay = 240,
		sensitivity = 0.5,
		touchpad = {
			natural_scroll = true,
			tap_to_click = true,
		},
	},
	gestures = {
		workspace_swipe_distance = 120,
		workspace_swipe_min_speed_to_force = 4,
	},
	general = {
		layout = "master",
		gaps_in = 5,
		gaps_out = 8,
		border_size = 2,
		col = {
			active_border = "rgba(33ccffee)",
			inactive_border = "rgba(595959aa)",
		},
	},
	decoration = {
		blur = {
			enabled = false,
			-- size = 8,
			-- passes = 2,
			-- contrast = 1.5,
			-- ignore_opacity = false,
			-- new_optimizations = true,
			-- special = false,
			-- xray = false,
		},
		shadow = {
			enabled = false,
		},
		dim_inactive = true,
		dim_strength = 0.1,
	},
	render = {
		direct_scanout = true,
		new_render_scheduling = true,
	},
	animations = {
		enabled = true,
	},
	master = {
		new_on_top = true,
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
	},
	debug = {
		vfr = true,
	},
	binds = {
		drag_threshold = 10,
	},
	xwayland = {
		force_zero_scaling = true,
	},
})

hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })
hl.gesture({ fingers = 2, direction = "pinchin", action = "cursorZoom", zoom_level = 1.15, mode = "mult" })
hl.gesture({ fingers = 2, direction = "pinchout", action = "cursorZoom", zoom_level = 0.87, mode = "mult" })
hl.gesture({ fingers = 4, direction = "left", action = "float", mode = "tile" })
hl.gesture({ fingers = 4, direction = "right", action = "float", mode = "float" })

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("snappy", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("softOut", { type = "bezier", points = { { 0.22, 1 }, { 0.36, 1 } } })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 4.8, bezier = "softOut" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.6, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.2, spring = "easy", style = "popin 88%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.6, bezier = "linear", style = "popin 88%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3.8, bezier = "snappy" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.6, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.4, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.8, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.6, bezier = "softOut" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.4, bezier = "softOut", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.6, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.3, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.2, bezier = "easeInOutCubic", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 2.6, bezier = "easeInOutCubic", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.6, bezier = "easeInOutCubic", style = "slidefade 20%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.2, bezier = "softOut", style = "slidevert" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 4.5, bezier = "snappy" })

local function tile_on_class(class)
	hl.window_rule({ match = { class = class }, tile = true })
end

local function workspace_for_class(class, workspace)
	hl.window_rule({ match = { class = class }, workspace = tostring(workspace) })
end

for _, rule in ipairs({
	{ "^(kitty)$", 1 },
	{ "^(Alacritty)$", 1 },
	{ "^(org.wezfurlong.wezterm)$", 1 },
	{ "^(com.mitchellh.ghostty)$", 1 },
	{ "^(kdesystemsettings)$", 2 },
	{ "^(Brave-browser)$", 3 },
	{ "^(firefox)$", 3 },
	{ "^(floorp)$", 3 },
	{ "^(zen)$", 3 },
	{ "^(Mercury Browser)$", 3 },
}) do
	tile_on_class(rule[1])
	workspace_for_class(rule[1], rule[2])
end

tile_on_class("^(ulauncher)$")
tile_on_class("discord")
tile_on_class("spotify")

hl.window_rule({
	match = { title = "^(Picture-in-Picture)$" },
	float = true,
	size = { 790, 451 },
	move = { 1100, 600 },
	persistent_size = true,
	content = "video",
	no_dim = true,
	no_initial_focus = true,
})

hl.window_rule({
	match = { class = "rofi" },
	float = true,
	opacity = "0.80",
})

hl.bind(main_mod .. " + Q", hl.dsp.window.close())
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(main_mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd("wezterm"))
hl.bind(main_mod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(main_mod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(main_mod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.float({ action = "toggle" }), { click = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(main_mod .. " + D", hl.dsp.exec_cmd("walker"))
hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())
hl.bind(main_mod .. " + Y", hl.dsp.exec_cmd("hyprshot -m region"))

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))
hl.bind("F12", hl.dsp.exec_cmd("brightnessctl -q set +5%"))
hl.bind("F11", hl.dsp.exec_cmd("brightnessctl -q set 5%-"))

hl.bind(main_mod .. " + R", hl.dsp.exec_cmd([[wf-recorder -g "$(slurp)"]]))
hl.bind(main_mod .. " + SHIFT + E", hl.dsp.exec_cmd("wlogout"))
hl.bind(main_mod .. " + SHIFT + RETURN", hl.dsp.layout("swapwithmaster"))
hl.bind(main_mod .. " + j", hl.dsp.layout("cyclenext"))
hl.bind(main_mod .. " + k", hl.dsp.layout("cycleprev"))
hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(main_mod .. " + left", hl.dsp.window.resize({ x = -40, y = 0, relative = true }))
hl.bind(main_mod .. " + right", hl.dsp.window.resize({ x = 40, y = 0, relative = true }))
hl.bind(main_mod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(main_mod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(main_mod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(main_mod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))

for i = 1, 10 do
	local key = tostring(i % 10)
	hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(main_mod .. " + SHIFT + p", hl.dsp.exec_cmd("walker --provider menus:powermenu"))
hl.bind(main_mod .. " + U", hl.dsp.workspace.toggle_special())
hl.bind(main_mod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "special", follow = true }))
hl.bind(main_mod .. " + SHIFT + n", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(main_mod .. " + V", hl.dsp.exec_cmd("pypr toggle volume"))
