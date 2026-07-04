vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	-- command = "silent! lua vim.highlight.on_yank({ timeout = 200 })",
	callback = function()
		vim.hl.hl_op()
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			-- except for in git commit messages
			-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
			if not vim.fn.expand("%:p"):find(".git", 1, true) then
				vim.cmd('exe "normal! g\'\\""')
			end
		end
	end,
})

-- Some buffer-switching paths load a file without the built-in BufRead
-- filetype detector taking effect. This is reproducible with both fzf-lua's
-- unloaded-buffer switch and nvim.dir's directory-buffer reuse.
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function(args)
		if vim.bo[args.buf].buftype ~= "" or vim.bo[args.buf].filetype ~= "" then
			return
		end

		local name = vim.api.nvim_buf_get_name(args.buf)
		if name == "" or vim.fn.isdirectory(name) == 1 then
			return
		end

		local filetype, on_detect = vim.filetype.match({
			filename = name,
			buf = args.buf,
		})
		if not filetype then
			return
		end

		if on_detect then
			on_detect(args.buf)
		end
		vim.bo[args.buf].filetype = filetype
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
