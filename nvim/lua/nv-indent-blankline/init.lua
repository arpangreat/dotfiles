vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	char = "│", -- ┆ ┊ 
	show_foldtext = false,
	context_char = "▎",
	char_priority = 12,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	show_current_context_start_on_current_line = false,
	use_treesitter = true,
	show_first_indent_level = true,
})
