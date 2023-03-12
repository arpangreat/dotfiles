require("onedarkpro").setup({
	colors = {}, -- Override default colors or create your own
	highlights = {}, -- Override default highlight groups or create your own
	filetypes = { -- Override which filetype highlight groups are loaded
		-- See the 'Configuring filetype highlights' section for the available list
	},
	plugins = { -- Override which plugin highlight groups are loaded
		-- See the 'Supported plugins' section for the available list
		all = true,
	},
	styles = { -- For example, to apply bold and italic, use "bold,italic"
		types = "bold", -- Style that is applied to types
		numbers = "italic", -- Style that is applied to numbers
		strings = "bold,italic", -- Style that is applied to strings
		comments = "italic", -- Style that is applied to comments
		keywords = "bold,italic", -- Style that is applied to keywords
		constants = "bold", -- Style that is applied to constants
		functions = "italic", -- Style that is applied to functions
		operators = "italic", -- Style that is applied to operators
		variables = "bold,italic", -- Style that is applied to variables
		conditionals = "italic", -- Style that is applied to conditionals
		virtual_text = "bold,italic", -- Style that is applied to virtual text
	},
	options = {
		bold = true, -- Use bold styles?
		italic = true, -- Use italic styles?
		underline = true, -- Use underline styles?
		undercurl = true, -- Use undercurl styles?

		cursorline = true, -- Use cursorline highlighting?
		transparency = true, -- Use a transparent background?
		terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
		highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
	},
})

vim.cmd("colorscheme onedark")
