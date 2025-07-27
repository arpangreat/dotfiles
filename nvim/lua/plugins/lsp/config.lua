local M = {}
M.on_attach = function(client, bufnr)
	vim.lsp.inlay_hint.enable(true, { bufnr })

	client.server_capabilities.documentFormattingprovider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	client.server_capabilities.didSave = false

	vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "K", "<cmd>FzfLua require('pretty_hover').hover()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "go", "<cmd>FzfLua lsp_typedefs<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "g0", "<cmd>FzfLua lsp_document_symbols<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gW", "<cmd>FzfLua lsp_workspace_symbols<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "ga", "<cmd>FzfLua lsp_code_actions<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gk", "<cmd>lua vim.diagnostic.jump({count = -1})<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gj", "<cmd>lua vim.diagnostic.jump({count = 1})<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gl", "<cmd>FzfLua lsp_document_diagnostics<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gL", "<cmd>FzfLua lsp_workspace_diagnostics<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gF", "<cmd>FzfLua lsp_finder<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gq", "<cmd>lua vim.diagnostic.setqflist()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gt", "<cmd>lua vim.diagnostic.setloclist()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "<Leader>rg", "<cmd>lua vim.lsp.codelens.run()<CR>")
	vim.keymap.set(
		"n",
		"<leader>gwa",
		"<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"<Leader>gwr",
		"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
		{ noremap = true, silent = true }
	)
	vim.keymap.set("n", "<Leader>gwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { noremap = true, silent = true })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = vim.tbl_deep_extend("force", M.capabilities, require("blink.cmp").get_lsp_capabilities({}, false))
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.foldingRange.dynamicRegistration = false
M.capabilities.textDocument.foldingRange.lineFoldingOnly = true
-- M.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

-- vim.lsp.config("*", {
-- 	on_attach = M.on_attach,
-- 	capabilities = M.capabilities,
-- })

return M
