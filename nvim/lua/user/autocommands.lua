vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
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

-- Remove unwanted formatoptions — only needs FileType, not BufEnter/BufWinEnter.
-- Those extra events caused redundant work on every buffer switch.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.schedule(function()
			vim.opt_local.formatoptions:remove({ "c", "r", "o" })
		end)
	end,
})

-- Arrow key training — pure Lua keymaps instead of vim.cmd
local map = vim.keymap.set
map("n", "<Left>",  function() vim.notify("Use h", vim.log.levels.ERROR) end)
map("n", "<Right>", function() vim.notify("Use l", vim.log.levels.ERROR) end)
map("n", "<Up>",    function() vim.notify("Use k", vim.log.levels.ERROR) end)
map("n", "<Down>",  function() vim.notify("Use j", vim.log.levels.ERROR) end)
map("i", "<Left>",  function() vim.notify("Use h", vim.log.levels.ERROR) end)
map("i", "<Right>", function() vim.notify("Use l", vim.log.levels.ERROR) end)
map("i", "<Up>",    function() vim.notify("Use k", vim.log.levels.ERROR) end)
map("i", "<Down>",  function() vim.notify("Use j", vim.log.levels.ERROR) end)
