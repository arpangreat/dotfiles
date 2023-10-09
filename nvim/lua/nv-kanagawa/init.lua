-- Default options:
require("kanagawa").setup({
	compile = true, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = { bold = true, italic = true },
	keywordStyle = {},
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = true, -- do not set background color
	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = { -- add/modify theme and palette colors
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
	overrides = function(colors) -- add/modify highlights
		return {
			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none" },
			FloatTitle = { bg = "none" },

			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
		}
	end,
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa-wave")
