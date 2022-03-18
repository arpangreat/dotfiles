-- Default options
require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		-- compile_path = util.join_paths(vim.fn.stdpath("cache"), "nightfox"),
		-- compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = false, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*)
		dim_inactive = true, -- Non focused panes set to alternative background
		styles = { -- Style to be applied to different syntax groups
			comments = "italic, bold",
			functions = "italic",
			keywords = "italic, bold",
			numbers = "bold",
			strings = "italic",
			types = "italic",
			variables = "italic",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = false,
			search = false,
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
})

-- setup must be called before loading
vim.cmd("colorscheme nightfox")
