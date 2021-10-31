local catppuccino = require("catppuccino")

-- configure it
catppuccino.setup(
    {
		colorscheme = "dark_catppuccino",
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
				},
        nvimtree = {
          enabled = true,
          show_root = true, -- makes the root folder not transparent
        }
			},
			lsp_trouble = true,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = false,
			which_key = true,
			indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
			dashboard = false,
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

