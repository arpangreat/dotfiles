if vim.fn.has("nvim-0.8") == 1 then
	vim.api.nvim_create_autocmd(
		{ "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
		{
			callback = function()
				require("nv-winbar").get_winbar()
			end,
		}
	)
end
