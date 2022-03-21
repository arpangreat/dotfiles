-- Default options:
require("kanagawa").setup({
	undercurl = true, -- enable undercurls
	commentStyle = "italic",
	functionStyle = "italic",
	keywordStyle = "italic",
	statementStyle = "bold",
	typeStyle = "italic",
	variablebuiltinStyle = "italic",
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = true, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	globalStatus = true,
	colors = {},
	overrides = {},
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
