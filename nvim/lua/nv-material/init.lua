vim.g.material_style = "deep ocean"

require("material").setup({

	borders = true, -- Enable borders between verticaly split windows

	contrast = {
		terminal = false, -- Enable contrast for the built-in terminal
		sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = false, -- Enable contrast for floating windows
		cursor_line = true, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
	},

	styles = {
		comments = { italic = true, bold = true }, -- Enable italic comments
		keywords = { bold = true }, -- Enable italic keywords
		functions = { italic = true }, -- Enable italic functions
		strings = { italic = true }, -- Enable italic strings
		variables = { bold = true }, -- Enable italic variables
		operators = { bold = true },
		types = { bold = true },
	},

	--[[ contrast_windows = { -- Specify which windows get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
		"qf", -- Darker qf list background
	}, ]]

	plugins = { -- Uncomment the plugins that you use to highlight them
		-- Available plugins:
		"dap",
		"dashboard",
		"gitsigns",
		"hop",
		"indent-blankline",
		"lspsaga",
		"mini",
		"neogit",
		"neorg",
		"nvim-cmp",
		"nvim-navic",
		"nvim-tree",
		"nvim-web-devicons",
		"sneak",
		"telescope",
		"trouble",
		"which-key",
	},

	-- high_visibility = {
	-- 	lighter = false, -- Enable higher contrast text for lighter style
	-- 	darker = true, -- Enable higher contrast text for darker style
	-- },

	disable = {
		background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = true, -- Prevent the theme from setting terminal colors
		eob_lines = true, -- Hide the end-of-buffer lines
	},

	lualine_style = "default",

	async_loading = true,

	custom_highlights = {}, -- Overwrite highlights with your own
})

vim.cmd([[colorscheme material]])
