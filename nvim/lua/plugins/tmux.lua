local M = {}

function M.setup()
	vim.keymap.set("n", "<A-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
	vim.keymap.set("n", "<A-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
	vim.keymap.set("n", "<A-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
	vim.keymap.set("n", "<A-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
	vim.keymap.set("n", "<A-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")
end

return M
