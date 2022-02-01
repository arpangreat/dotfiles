vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	buftype_exclude = { "terminal", "Dashboard" },
	filetype_exclude = "dashboard",
	use_treesitter = true,
})

vim.api.nvim_exec(
	[[
  autocmd BufEnter * :IndentBlanklineEnable
  ]],
	true
)
