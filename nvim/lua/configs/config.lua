local M = {}

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then
			return
		end

		vim.lsp.inlay_hint.enable(true, { bufnr })

		local opts = function(desc)
			return { buffer = bufnr, desc = desc }
		end

		vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts("LSP definitions"))
		vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts("LSP implementations"))
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts("Signature help"))
		vim.keymap.set("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", opts("LSP declarations"))
		vim.keymap.set("n", "go", "<cmd>FzfLua lsp_typedefs<CR>", opts("LSP type definitions"))
		vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts("LSP rename"))
		vim.keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts("LSP references"))
		vim.keymap.set("n", "g0", "<cmd>FzfLua lsp_document_symbols<CR>", opts("Document symbols"))
		vim.keymap.set("n", "gW", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts("Workspace symbols"))
		vim.keymap.set("n", "ga", "<cmd>FzfLua lsp_code_actions<CR>", opts("Code actions"))
		vim.keymap.set("n", "gk", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts("Previous diagnostic"))
		vim.keymap.set("n", "gj", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts("Next diagnostic"))
		vim.keymap.set("n", "gl", "<cmd>FzfLua lsp_document_diagnostics<CR>", opts("Document diagnostics"))
		vim.keymap.set("n", "gL", "<cmd>FzfLua lsp_workspace_diagnostics<CR>", opts("Workspace diagnostics"))
		vim.keymap.set("n", "gF", "<cmd>FzfLua lsp_finder<CR>", opts("LSP finder"))
		vim.keymap.set("n", "gq", vim.diagnostic.setqflist, opts("Diagnostics to quickfix"))
		vim.keymap.set("n", "gt", vim.diagnostic.setloclist, opts("Diagnostics to loclist"))
		vim.keymap.set("n", "<Leader>rg", vim.lsp.codelens.run, opts("Run codelens"))
		vim.keymap.set("n", "<Leader>gwa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
		vim.keymap.set("n", "<Leader>gwr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
		vim.keymap.set("n", "<Leader>gwl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts("List workspace folders"))

		if client.server_capabilities.codeLensProvider then
			vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
				buffer = bufnr,
				callback = vim.lsp.codelens.refresh,
			})
		end
	end,
})

-- Compute capabilities lazily
local _capabilities = nil

function M.get_capabilities()
	if _capabilities then
		return _capabilities
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()

	_capabilities = vim.tbl_deep_extend("force", capabilities, {
		textDocument = {
			completion = {
				completionItem = { snippetSupport = true },
			},
			codelens = {
				dynamicRegistration = false,
			},
		},
	})

	return _capabilities
end

M.capabilities = setmetatable({}, {
	__index = function()
		return M.get_capabilities()
	end,
})

return M
