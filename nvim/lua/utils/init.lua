local P = function(args)
	print(vim.inspect(args))
	return args
end

--vim.api.nvim_buf_create_user_command(bufnr, "LspFormat", vim.lsp.buf.formatting, { desc = "Format cur buf with lsp" })
