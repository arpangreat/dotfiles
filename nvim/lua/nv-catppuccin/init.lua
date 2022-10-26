--[[ local color = require("catppuccin.palettes").get_palette() -- fetch colors from palette
require("catppuccin.lib.highlighter").syntax({
	CursorLine = { bg = color.surface2 },
}) ]]

-- configure it
require("catppuccin").setup({
	flavour = "mocha",
	background = { dark = "mocha" },
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
		numbers = { "italic" },
		booleans = { "italic" },
		properties = { "bold" },
		types = { "bold" },
		operators = { "bold" },
	},
	integrations = {
		treesitter = true,
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
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		cmp = true,
		gitgutter = true,
		gitsigns = true,
		telescope = true,
		--[[ nvimtree = {
			enabled = true,
			show_root = true,
		}, ]]
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		dashboard = true,
		barbar = true,
		-- bufferline = true,
		-- markdown = true,
		ts_rainbow = true,
		illuminate = true,
	},
	-- hop = true,
	custom_highlights = function(colors)
		return {
			Comment = { fg = colors.overlay1 },
			LineNr = { fg = colors.overlay1 },
			-- CursorLine = { bg = colors.mantle },
			CursorLineNr = { fg = colors.sky },
			DiagnosticVirtualTextError = { bg = colors.none },
			DiagnosticVirtualTextWarn = { bg = colors.none },
			DiagnosticVirtualTextInfo = { bg = colors.none },
			DiagnosticVirtualTextHint = { bg = colors.none },
		}
	end,
})

vim.api.nvim_command("colorscheme catppuccin")
