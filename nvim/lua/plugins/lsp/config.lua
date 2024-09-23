local M = {}
M.on_attach = function(client, bufnr)
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

	client.server_capabilities.documentFormattingprovider = false
	client.server_capabilities.documentRangeFormattingProvider = false

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

	-- ---Utility for keymap creation.
	-- ---@param lhs string
	-- ---@param rhs string|function
	-- ---@param opts string|table
	-- ---@param mode? string|string[]
	-- local function keymap(lhs, rhs, opts, mode)
	-- 	opts = type(opts) == "string" and { desc = opts }
	-- 		or vim.tbl_extend("error", opts --[[@as table]], { buffer = bufnr })
	-- 	mode = mode or "n"
	-- 	vim.keymap.set(mode, lhs, rhs, opts)
	-- end

	-- ---For replacing certain <C-x>... keymaps.
	-- ---@param keys string
	-- local function feedkeys(keys)
	-- 	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), "n", true)
	-- end

	-- ---Is the completion menu open?
	-- local function pumvisible()
	-- 	return tonumber(vim.fn.pumvisible()) ~= 0
	-- end

	-- -- Enable completion and configure keybindings.
	-- if client.supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
	-- 	vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })

	-- 	-- Use enter to accept completions.
	-- 	keymap("<cr>", function()
	-- 		return pumvisible() and "<C-y>" or "<cr>"
	-- 	end, { expr = true }, "i")

	-- 	-- Use slash to dismiss the completion menu.
	-- 	keymap("/", function()
	-- 		return pumvisible() and "<C-e>" or "/"
	-- 	end, { expr = true }, "i")

	-- 	-- Use <C-n> to navigate to the next completion or:
	-- 	-- - Trigger LSP completion.
	-- 	-- - If there's no one, fallback to vanilla omnifunc.
	-- 	keymap("<C-n>", function()
	-- 		if pumvisible() then
	-- 			feedkeys("<C-n>")
	-- 		else
	-- 			if next(vim.lsp.get_clients({ bufnr = 0 })) then
	-- 				vim.lsp.completion.trigger()
	-- 			else
	-- 				if vim.bo.omnifunc == "" then
	-- 					feedkeys("<C-x><C-n>")
	-- 				else
	-- 					feedkeys("<C-x><C-o>")
	-- 				end
	-- 			end
	-- 		end
	-- 	end, "Trigger/select next completion", "i")

	-- 	-- Buffer completions.
	-- 	keymap("<C-u>", "<C-x><C-n>", { desc = "Buffer completions" }, "i")

	-- 	-- Use <Tab> to accept a Copilot suggestion, navigate between snippet tabstops,
	-- 	-- or select the next completion.
	-- 	-- Do something similar with <S-Tab>.
	-- 	keymap("<Tab>", function()
	-- 		local copilot = require("copilot.suggestion")

	-- 		if copilot.is_visible() then
	-- 			copilot.accept()
	-- 		elseif pumvisible() then
	-- 			feedkeys("<C-n>")
	-- 		elseif vim.snippet.active({ direction = 1 }) then
	-- 			vim.snippet.jump(1)
	-- 		else
	-- 			feedkeys("<Tab>")
	-- 		end
	-- 	end, {}, { "i", "s" })
	-- 	keymap("<S-Tab>", function()
	-- 		if pumvisible() then
	-- 			feedkeys("<C-p>")
	-- 		elseif vim.snippet.active({ direction = -1 }) then
	-- 			vim.snippet.jump(-1)
	-- 		else
	-- 			feedkeys("<S-Tab>")
	-- 		end
	-- 	end, {}, { "i", "s" })

	-- 	-- Inside a snippet, use backspace to remove the placeholder.
	-- 	keymap("<BS>", "<C-o>s", {}, "s")

	-- 	vim.lsp.completion.trigger()
	-- end
end

-- M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.capabilities = vim.tbl_deep_extend(
	"force",
	vim.lsp.protocol.make_client_capabilities(),
	require("cmp_nvim_lsp").default_capabilities()
)
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
