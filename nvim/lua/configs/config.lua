local M = {}

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then
			return
		end

		local map = vim.keymap.set
		local function opts(desc)
			return { buffer = bufnr, desc = desc }
		end

		map("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts("LSP definitions"))
		map("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts("LSP implementations"))
		map("n", "gs", vim.lsp.buf.signature_help, opts("Signature help"))
		map("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", opts("LSP declarations"))
		map("n", "go", "<cmd>FzfLua lsp_typedefs<CR>", opts("LSP type definitions"))
		map("n", "grn", vim.lsp.buf.rename, opts("LSP rename"))
		map("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts("LSP references"))
		map("n", "g0", "<cmd>FzfLua lsp_document_symbols<CR>", opts("Document symbols"))
		map("n", "gW", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts("Workspace symbols"))
		map("n", "ga", "<cmd>FzfLua lsp_code_actions<CR>", opts("Code actions"))
		map("n", "gk", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts("Previous diagnostic"))
		map("n", "gj", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts("Next diagnostic"))
		map("n", "gl", "<cmd>FzfLua lsp_document_diagnostics<CR>", opts("Document diagnostics"))
		map("n", "gL", "<cmd>FzfLua lsp_workspace_diagnostics<CR>", opts("Workspace diagnostics"))
		map("n", "gF", "<cmd>FzfLua lsp_finder<CR>", opts("LSP finder"))
		map("n", "gq", vim.diagnostic.setqflist, opts("Diagnostics to quickfix"))
		map("n", "gt", vim.diagnostic.setloclist, opts("Diagnostics to loclist"))
		map("n", "<Leader>rg", vim.lsp.codelens.run, opts("Run codelens"))
		map("n", "<Leader>gwa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
		map("n", "<Leader>gwr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
		map("n", "<Leader>gwl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts("List workspace folders"))

		vim.lsp.semantic_tokens.enable(false)
		client.server_capabilities.semanticTokensProvider = nil

		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

		if client.server_capabilities.codeLensProvider then
			vim.api.nvim_create_autocmd({ "InsertLeave", "CursorHold" }, {
				buffer = bufnr,
				callback = function()
					vim.lsp.codelens.enable(true, { bufnr })
				end,
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
