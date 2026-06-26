local M = {}

function M.setup()
	require("trouble").setup({})

	vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
	vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
	vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
	vim.keymap.set("n", "<leader>xd", "<cmd>Trouble lsp_document_symbols toggle<cr>", { desc = "lsp_document_symbols (Trouble)" })
	vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
	vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
	vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble toggle<cr>", { desc = "Todo (Trouble)" })
	vim.keymap.set("n", "<leader>xo", "<cmd>Trouble<cr>", { desc = "Trouble" })
end

return M
