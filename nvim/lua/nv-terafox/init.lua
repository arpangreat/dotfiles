-- Default options
require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/terafox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = true, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		styles = { -- Style to be applied to different syntax groups
			comments = "italic,bold", -- Value is any valid attr-list value `:help attr-list`
			functions = "italic",
			keywords = "italic",
			numbers = "bold",
			strings = "italic",
			types = "italic",
			variables = "italic,bold",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = true,
			visual = false,
			search = false,
		},
		modules = { -- List of various plugins and additional options
			barbar = true,
			cmp = true,
			dashboard = true,
			diagnostic = true,
			fidget = true,
			gitgutter = true,
			gitsigns = true,
			symbol_outline = true,
			telescope = true,
			treesitter = true,
			tsrainbow = true,
			whichkey = true,
		},
	},
})

-- setup must be called before loading
vim.cmd("colorscheme terafox")
