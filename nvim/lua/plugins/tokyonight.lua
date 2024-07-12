return {
	"folke/tokyonight.nvim",
	priority = 1000,
	-- enabled = false,
	config = function()
		local bg = "#011628"
		local bg_dark = "#011423"
		local bg_highlight = "#143652"
		local bg_search = "#0A64AC"
		local bg_visual = "#275378"
		local fg = "#CBE0F0"
		local fg_dark = "#B4D0E9"
		local fg_gutter = "#627E97"
		local border = "#547998"

		require("tokyonight").setup({
			style = "storm",
			transparent = true,
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				comments = { italic = true },
				keywords = { bold = true },
				functions = { italic = true },
				variables = { italic = true, bold = true },
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = true, -- dims inactive windows
			lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = colors.red
				colors.bg = bg
				colors.bg_dark = bg_dark
				colors.bg_float = bg_dark
				colors.bg_highlight = bg_highlight
				colors.bg_popup = bg_dark
				colors.bg_search = bg_search
				colors.bg_sidebar = bg_dark
				colors.bg_statusline = bg_dark
				colors.bg_visual = bg_visual
				colors.border = border
				colors.fg = fg
				colors.fg_dark = fg_dark
				colors.fg_float = fg
				colors.fg_gutter = fg_gutter
				colors.fg_sidebar = fg_dark
			end,

			on_highlights = function(hl, c)
				-- hl.CursorLineNr = { fg = c.purple }
				hl["@variable"] = { fg = c.red }
				hl.LspInlayHint = { bg = "#063540" }
				hl.WinBar = { bg = c.none }
				local prompt = "#2d3149"
				hl.TelescopeNormal = {
					bg = c.bg_dark,
					fg = c.fg_dark,
				}
				hl.TelescopeBorder = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopePromptNormal = {
					bg = prompt,
				}
				hl.TelescopePromptBorder = {
					bg = prompt,
					fg = prompt,
				}
				hl.TelescopePromptTitle = {
					bg = prompt,
					fg = prompt,
				}
				hl.TelescopePreviewTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopeResultsTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				} -- hl.String = { fg = c.green, style = "italic" }
			end,
		})
	end,
}
