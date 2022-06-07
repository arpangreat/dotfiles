local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup({
	transparent_background = true,
	term_colors = true,
	styles = {
		comments = "italic",
		functions = "italic",
		keywords = "italic",
		strings = "italic",
		variables = "italic",
		conditionals = "italic",
		loops = "bold",
		numbers = "italic",
		booleans = "italic",
		properties = "bold",
		types = "bold",
		operators = "bold",
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		cmp = true,
		lsp_trouble = true,
		lsp_saga = true,
		gitgutter = true,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = true,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		dashboard = true,
		neogit = true,
		vim_sneak = true,
		fern = true,
		barbar = true,
		bufferline = true,
		markdown = true,
		lightspeed = false,
		ts_rainbow = true,
		hop = true,
	},
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

local colors = require("catppuccin.api.colors").get_colors()

catppuccin.remap({
	Comment = { fg = colors.overlay1 },
	LineNr = { fg = colors.overlay1 },
	CursorLineNr = { fg = colors.sky },
	NvimTreeRootFolder = { fg = colors.sky },
	-- DiagnosticInfo = { bg = colors.none },
	-- DiagnosticError = { bg = colors.none },
	-- DiagnosticHint = { bg = colors.none },
	-- DiagnosticWarn = { bg = colors.none },
})

-- Lua
vim.cmd([[colorscheme catppuccin]])
