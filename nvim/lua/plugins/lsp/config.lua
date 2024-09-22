local M = {}
M.on_attach = function(client_id, bufnr)
	--[[ if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end ]]

	-- vim.lsp.completion.enable(true, vim.lsp.get_client_by_id(), bufnr, { true })

	-- if client.server_capabilities.inlayHintProvider then
	vim.lsp.inlay_hint.enable(true, { bufnr })
	-- vim.lsp.inlay_hint.enable(bufnr)
	-- end

	-- if client.supports_method("textDocument/formatting") then
	--   vim.api.nvim_create_autocmd("BufWritePre", {
	--     pattern = "*",
	--     callback = function()
	--       -- async_formatting(bufnr)
	--       vim.lsp.buf.format()
	--     end,
	--   })
	-- end

	client_id.server_capabilities.documentFormattingprovider = false
	client_id.server_capabilities.documentRangeFormattingProvider = false

	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "K", "<cmd>lua require('pretty_hover').hover()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", { noremap = true, silent = true })
	vim.keymap.set(
		"n",
		"ga",
		"<cmd>lua require('actions-preview').code_actions()<CR>",
		{ noremap = true, silent = true }
	)
	vim.keymap.set("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
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
M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
-- local capabilities = vim.tbl_deep_extend(
--   'force',
--   vim.lsp.protocol.make_client_capabilities(),
--   require('epo').register_cap()
-- )
-- M.capabilities = require("epo").register_cap()

--   require('epo').register_cap()
-- )
-- M.capabilities = require("epo").register_cap()

return M
