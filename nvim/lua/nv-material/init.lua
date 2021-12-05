vim.g.material_style = "deep ocean"

require("material").setup({

	contrast = false, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
	borders = true, -- Enable borders between verticaly split windows

	popup_menu = "colorful", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

	italics = {
		comments = true, -- Enable italic comments
		keywords = true, -- Enable italic keywords
		functions = true, -- Enable italic functions
		strings = true, -- Enable italic strings
		variables = true, -- Enable italic variables
	},

	contrast_windows = { -- Specify which windows get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
		"qf", -- Darker qf list background
	},

	text_contrast = {
		lighter = true, -- Enable higher contrast text for lighter style
		darker = true, -- Enable higher contrast text for darker style
	},

	disable = {
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = true, -- Hide the end-of-buffer lines
	},

	custom_highlights = {}, -- Overwrite highlights with your own
})

vim.cmd([[colorscheme material]])
vim.cmd([[highlight Normal guibg=none]])
