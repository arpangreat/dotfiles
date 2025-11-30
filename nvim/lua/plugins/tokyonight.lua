return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	-- enabled = false,
	config = function()
		require("tokyonight").setup({
			style = "moon",
			transparent = true,
			-- terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				-- comments = { italic = true },
				keywords = { bold = true, italic = true },
				functions = { italic = true },
				variables = { italic = true, bold = true },
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			-- day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = true, -- dims inactive windows
			lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

			cache = true,
			on_colors = function(c)
				-- 	-- DARKER background to match wallpaper + transparency
				-- 	c.bg = "#080C16"
				-- 	c.bg_dark = "#060910"

				-- 	-- Slightly dimmed foreground for low-glow reading
				-- 	c.fg = "#C9D3EF"
				-- 	c.fg_dark = "#B5BDD6"

				-- 	-- Palette patch (ONLY the values you asked to darken)
				-- 	c.blue = "#6A8EE0" -- palette 4
				-- 	c.cyan = "#5ABFD8" -- palette 6
				-- 	c.blue1 = "#81A0E5" -- palette 12
				-- 	c.blue2 = "#92D4EA" -- palette 14

				-- 	-- Darker highlights (matches Ghostty palette 0 and 8)
				-- 	c.bg_highlight = "#0B101C"
				-- 	c.bg_visual = "#152035"

				-- 	-- Keep Tokyonight warmth/accents (unchanged)
				-- 	-- Red, yellow, magenta, green all stay default
			end,

			on_highlights = function(hl, c)
				hl["@variable"] = { fg = c.red }
				hl["@lsp.type.namespace"] = { italic = true, bold = true }
				hl["@operator"] = { bold = true }
				hl.LspInlayHint = { bg = "#063540", fg = c.blue2 }
				hl.CursorLine = { bg = "#182235" }
			end,
		})
	end,
}
