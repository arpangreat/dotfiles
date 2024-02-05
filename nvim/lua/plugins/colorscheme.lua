return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			light_style = "day", -- The theme is used when the background is set to light
			transparent = true, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				comments = { italic = true },
				keywords = { bold = true },
				functions = { italic = true },
				variables = { italic = true, bold = true },
				background = "transparent",
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			-- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = true, -- dims inactive windows
			lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

			--- You can override specific color groups to use other groups or a hex color
			--- function will be called with a ColorScheme table
			---@param colors ColorScheme
			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = colors.red
			end,

			--- You can override specific highlights to use other groups or a hex color
			--- function will be called with a Highlights and ColorScheme table
			---@param hl Highlights
			---@param c ColorScheme
			on_highlights = function(hl, c)
				-- hl.CursorLineNr = { fg = c.purple }
				hl["@variable"] = { fg = c.red }
				hl.LspInlayHint = { bg = "#063540" }
				hl.WinBar = { bg = c.none }
				hl.String = { fg = c.green, style = "italic" }
			end,
		},
	},
	{
		"craftzdog/solarized-osaka.nvim",
		priority = 1000,
		opts = {
			transparent = true, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = true },
				keywords = { bold = true },
				-- functions = { italic = true  },
				variables = { italic = true },
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			-- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = true, -- dims inactive windows
			lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

			--- You can override specific color groups to use other groups or a hex color
			--- function will be called with a ColorScheme table
			---@param colors ColorScheme
			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = colors.red
			end,

			--- You can override specific highlights to use other groups or a hex color
			--- function will be called with a Highlights and ColorScheme table
			---@param hl Highlights
			---@param c ColorScheme
			on_highlights = function(hl, c)
				-- hl.CursorLineNr = { fg = c.purple }
				hl.LspInlayHint = { bg = c.base02 }
				hl["@variable"] = { fg = c.red100 }
				-- hl["lualine.themes.tokyonight.c"] = { bg = c.none }
			end,
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			-- background = { dark = "mocha" },
			transparent_background = true,
			term_colors = true,
			compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
			styles = {
				comments = { "italic" },
				functions = { "italic" },
				keywords = { "italic" },
				strings = { "italic" },
				variables = { "italic" },
				conditionals = { "italic" },
				loops = { "bold" },
				-- numbers = { "" },
				booleans = { "bold" },
				properties = { "bold" },
				types = { "bold" },
				operators = { "bold" },
			},
			integrations = {
				telescope = { enabled = true, style = "nvchad", results_title = true },
				navic = true,
				which_key = true,
				noice = true,
				mason = true,
			},
			-- hop = true,
			custom_highlights = function(colors)
				return {
					Comment = { fg = colors.overlay1 },
					LineNr = { fg = colors.overlay1 },
					["@variable"] = { fg = colors.red },
					["@variable.member"] = { fg = colors.maroon },
					["@namespace"] = { fg = colors.pink },
					["@field"] = { fg = colors.pink },
					-- CursorLine = { bg = colors.mantle },
					CursorLineNr = { fg = colors.sky },
				}
			end,
		},
	},
	{
		"marko-cerovac/material.nvim",
		priority = 1000,
		opts = {
			contrast = {
				terminal = true,
				sidebars = true,
				floating_windows = true,
				cursor_line = true,
				non_current_windows = true,
			},

			styles = {
				strings = { italic = true },
				keywords = { bold = true },
				funtions = { italic = true, bold = true },
				variables = { italic = true },
				operators = { bold = true },
				types = { italic = true, bold = true },
			},

			plugins = {
				"dap",
				"gitsigns",
				"harpoon",
				"mini",
				"noice",
				"nvim-cmp",
				"nvim-navic",
				"nvim-web-devicons",
				"telescope",
				"which-key",
			},

			lualine_style = "stealth",
		},
	},
}
