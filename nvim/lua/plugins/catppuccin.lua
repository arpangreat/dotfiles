return {
	"catppuccin/nvim",
	name = "catppuccin",
	enabled = true,
	priority = 1000,
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		-- flavour = "auto" -- will respect terminal's background
		-- background = { -- :h background
		-- 	light = "latte",
		-- 	dark = "mocha",
		-- },
		transparent_background = true, -- disables setting the background color.
		-- show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
		term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
		dim_inactive = {
			enabled = false, -- dims the background color of inactive window
			shade = "dark",
			percentage = 0.15, -- percentage of the shade to apply to the inactive window
		},
		-- no_italic = false, -- Force no italic
		-- no_bold = false, -- Force no bold
		-- no_underline = false, -- Force no underline
		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
			comments = { "italic" }, -- Change the style of comments
			conditionals = { "italic" },
			loops = { "bold" },
			functions = { "italic" },
			keywords = { "bold" },
			strings = { "italic" },
			variables = { "italic", "bold" },
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
			-- miscs = {}, -- Uncomment to turn off hard-coded styles
		},
		color_overrides = {},
		custom_highlights = function(colors)
			return {
				MiniCursorword = { bg = colors.surface1, style = {} },
				MiniCursorwordCurrent = { bg = colors.surface1, style = {} },
				["@variable"] = { fg = colors.maroon },
			}
		end,
		default_integrations = false,
		integrations = {
			cmp = true,
			gitsigns = true,
			-- nvimtree = true,
			treesitter = true,
			-- notify = true,
			mini = {
				enabled = true,
				indentscope_color = "",
			},
			mason = true,
			noice = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underdashed" },
					warnings = { "undercurl" },
					information = { "underdotted" },
				},
				inlay_hints = {
					background = true,
				},
			},
			navic = true,
			which_key = true,
			fidget = true,
		},
		compile_path = vim.fn.stdpath("cache") .. "nvim/catppuccin",
	},
}
