local catppuccino = require("catppuccino")

-- configure it
catppuccino.setup(
    {
		colorscheme = "neon_latte",
		transparency = true,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			strings = "italic",
			variables = "italic",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				styles = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic"
				}
			},
			lsp_trouble = true,
			lsp_saga = true,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = true,
			which_key = true,
			indent_blankline = true,
			dashboard = true,
			neogit = true,
			vim_sneak = true,
			fern = true,
			barbar = true,
			bufferline = true,
			markdown = true,
		}
	}
)

-- load it
catppuccino.load()

