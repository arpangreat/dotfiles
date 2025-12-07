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

		local has_conform_formatter = false
		local available = require("conform").list_formatters(bufnr)
		has_conform_formatter = available and #available > 0

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
		vim.keymap.set(
			"n",
			"gk",
			"<cmd>lua vim.diagnostic.jump({count = -1, float = true})<CR>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"gj",
			"<cmd>lua vim.diagnostic.jump({count = 1, float = true})<CR>",
			{ noremap = true, silent = true }
		)
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
		end

		vim.keymap.set(
			"n",
			"<Leader>rg",
			"<cmd>lua vim.lsp.codelens.run()<CR>",
			{ desc = "Run CodeLens", buffer = bufnr }
		)
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
