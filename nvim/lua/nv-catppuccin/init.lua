local colors = require("catppuccin.palettes").get_palette()
colors.none = "NONE"

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

-- configure it
require("catppuccin").setup({
	transparent_background = true,
	term_colors = true,
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
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
		-- lsp_trouble = true,
		-- lsp_saga = true,
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
		-- neogit = true,
		-- vim_sneak = true,
		-- fern = true,
		barbar = true,
		-- bufferline = true,
		-- markdown = true,
		ts_rainbow = true,
		illuminate = true,
	},
	-- hop = true,
	custom_highlights = {
		Comment = { fg = colors.overlay1 },
		LineNr = { fg = colors.overlay1 },
		CursorLine = { bg = colors.surface0 },
		CursorLineNr = { fg = colors.sky },
		DiagnosticVirtualTextError = { bg = colors.none },
		DiagnosticVirtualTextWarn = { bg = colors.none },
		DiagnosticVirtualTextInfo = { bg = colors.none },
		DiagnosticVirtualTextHint = { bg = colors.none },
		--[[ IlluminatedWordWrite = { bg = colors.overlay2 },
		IlluminatedWordRead = { bg = colors.overlay2 },
		IlluminatedWordText = { bg = colors.overlay2 }, ]]
	},
})

vim.cmd([[ colorscheme catppuccin ]])
