vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.rs" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})
