vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	-- command = "silent! lua vim.highlight.on_yank({ timeout = 200 })",
	callback = function()
		vim.hl.hl_op()
	end,
})

local cursor_restored = {}

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function(args)
		local name = vim.api.nvim_buf_get_name(args.buf)
		if name == "" or cursor_restored[args.buf] == name or vim.bo[args.buf].buftype ~= "" then
			return
		end
		cursor_restored[args.buf] = name

		local win = vim.api.nvim_get_current_win()
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		if vim.api.nvim_win_get_buf(win) ~= args.buf or vim.bo[args.buf].filetype == "gitcommit" then
			return
		end

		if mark[1] <= 1 or mark[1] > vim.api.nvim_buf_line_count(args.buf) then
			return
		end

		local line = vim.api.nvim_buf_get_lines(args.buf, mark[1] - 1, mark[1], false)[1]
		vim.api.nvim_win_set_cursor(win, { mark[1], math.min(mark[2], #line) })
	end,
})

vim.api.nvim_create_autocmd("BufWipeout", {
	callback = function(args)
		cursor_restored[args.buf] = nil
	end,
})

-- This runs after everything else
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter" }, {
	pattern = "*",
	callback = function()
		vim.schedule(function()
			vim.opt_local.formatoptions:remove({ "c", "r", "o" })
		end)
	end,
})

-- HACK:
-- Try to prevent bad habits like using the arrow keys for movement. This is
-- not the only possible bad habit. For example, holding down the h/j/k/l keys
-- for movement, rather than using more efficient movement commands, is also a
-- bad habit. The former is enforceable through a .vimrc, while we don't know
-- how to prevent the latter.
-- Do this in normal mode...
vim.cmd('nnoremap <Left>  :echoe "Use h"<CR>')
vim.cmd('nnoremap <Right> :echoe "Use l"<CR>')
vim.cmd('nnoremap <Up>    :echoe "Use k"<CR>')
vim.cmd('nnoremap <Down>  :echoe "Use j"<CR>')
-- ...and in insert mode
vim.cmd('inoremap <Left>  <ESC>:echoe "Use h"<CR>')
vim.cmd('inoremap <Right> <ESC>:echoe "Use l"<CR>')
vim.cmd('inoremap <Up>    <ESC>:echoe "Use k"<CR>')
vim.cmd('inoremap <Down>  <ESC>:echoe "Use j"<CR>')
