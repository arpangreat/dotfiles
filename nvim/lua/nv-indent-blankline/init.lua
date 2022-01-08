vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
vim.g.indent_blankline_filetype_exclude = "dashboard"
vim.g.indent_blankline_use_treesitter = true

require("indent_blankline").setup({
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	buftype_exclude = { "terminal", "Dashboard" },
})

vim.api.nvim_exec(
	[[
  autocmd BufEnter * :IndentBlanklineEnable
  ]],
	true
)
