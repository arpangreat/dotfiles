local conform_ok, conform = pcall(require, "conform")
local M = {}
M.on_attach = function(client, bufnr)
	vim.lsp.inlay_hint.enable(true, { bufnr })

	local has_conform_formatter = false
	if conform_ok then
		local available = conform.list_formatters(bufnr)
		has_conform_formatter = available and #available > 0
	end

	-- Enable or disable LSP formatting dynamically
	if has_conform_formatter then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	else
		client.server_capabilities.documentFormattingProvider = true
		client.server_capabilities.documentRangeFormattingProvider = true
	end

	vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", { noremap = true, silent = true })
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
	end, { noremap = true, silent = true, desc = "List workspace files" })

	if client.server_capabilities.codeLensProvider then
		vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
			buffer = bufnr,
			callback = vim.lsp.codelens.refresh,
		})

		vim.keymap.set(
			"n",
			"<Leader>rg",
			"<cmd>lua vim.lsp.codelens.run()<CR>",
			{ desc = "Run CodeLens", buffer = bufnr }
		)
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

capabilities = vim.tbl_deep_extend("force", capabilities, {
	textDocument = {
		completion = {
			completionItem = { snippetSupport = true },
		},
		--[[ foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}, ]]
	},
	experimental = {
		serverStatusNotification = true,
		commands = {
			commands = {
				"rust-analyzer.showReferences",
				"rust-analyzer.runSingle",
				"rust-analyzer.debugSingle",
			},
		},
	},
})

-- vim.lsp.config("*", {
-- 	on_attach = M.on_attach,
-- 	capabilities = M.capabilities,
-- })

return M
