return {
	"folke/tokyonight.nvim",
	priority = 1000,
	-- enabled = false,
	config = function()
		require("tokyonight").setup({
			style = "storm",
			transparent = true,
			-- terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				-- comments = { italic = true },
				keywords = { bold = true },
				functions = { italic = true },
				variables = { italic = true, bold = true },
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			-- day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = true, -- dims inactive windows
			lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

			-- cache = false,

			---@class colors
			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = colors.red
				colors.bg_statusline = colors.none
				-- colors.bg = bg
				-- colors.bg_dark = bg_dark
				-- colors.bg_float = bg_dark
				-- colors.bg_highlight = bg_highlight
				-- colors.bg_popup = bg_dark
				-- colors.bg_search = bg_search
				-- colors.bg_sidebar = bg_dark
				-- colors.bg_visual = bg_visual
				-- colors.border = border
				-- colors.fg = fg
				-- colors.fg_dark = fg_dark
				-- colors.fg_float = fg
				-- colors.fg_gutter = fg_gutter
				-- colors.fg_sidebar = fg_dark
			end,

			on_highlights = function(hl, c)
				-- hl.CursorLineNr = { fg = c.purple }
				hl["@variable"] = { fg = c.red }
				hl["@lsp.type.namespace"] = { italic = true, bold = true }
				hl["@operator"] = { bold = true }
				hl.LspInlayHint = { bg = "#063540" }
				hl.WinBar = { bg = c.none }
				hl.MiniCursorword = { bg = c.terminal_black }
				hl.MiniCursorwordCurrent = { bg = c.terminal_black }
				hl.CursorLine = { bg = c.bg_highlight }
				hl.Tabline = { bg = c.none }
				hl.BlinkCmpMenu = { fg = c.fg, bg = c.bg_float }
				hl.BlinkCmpMenuBorder = { fg = c.border_highlight, bg = c.bg_float }
				hl.BlinkCmpSignatureHelp = { fg = c.fg, bg = c.bg_float }
				hl.BlinkCmpSignatureHelpBorder = { fg = c.border_highlight, bg = c.bg_float }
				-- local prompt = "#2d3149"
				-- hl.TelescopeNormal = {
				-- 	bg = c.bg_dark,
				-- 	fg = c.fg_dark,
				-- }
				-- hl.TelescopeBorder = {
				-- 	bg = c.bg_dark,
				-- 	fg = c.bg_dark,
				-- }
				-- hl.TelescopePromptNormal = {
				-- 	bg = prompt,
				-- }
				-- hl.TelescopePromptBorder = {
				-- 	bg = prompt,
				-- 	fg = prompt,
				-- }
				-- hl.TelescopePromptTitle = {
				-- 	bg = prompt,
				-- 	fg = prompt,
				-- }
				-- hl.TelescopePreviewTitle = {
				-- 	bg = c.bg_dark,
				-- 	fg = c.bg_dark,
				-- }
				-- hl.TelescopeResultsTitle = {
				-- 	bg = c.bg_dark,
				-- 	fg = c.bg_dark,
				-- }
				hl.String = { fg = c.green, italic = true }
			end,
		})
	end,
}
