return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		vim.diagnostic.config({
			virtual_lines = {
				current_line = true,
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = " ",
					[vim.diagnostic.severity.INFO] = " ",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					[vim.diagnostic.severity.WARN] = "WarnMsg",
					[vim.diagnostic.severity.HINT] = "HintMsg",
					[vim.diagnostic.severity.INFO] = "InfoMsg",
				},
			},
			status = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = " ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			update_in_insert = false,
			undercurl = true,
			float = {
				scope = "line",
				-- focusable = true,
				-- style = "minimal",
				border = "single",
				-- source = "if_many",
				-- header = "",
				-- prefix = "",
			},
			on_jump = {
				float = true,
			},
		})

		vim.lsp.config("*", {
			-- on_attach = require("plugins.lsp.config").on_attach,
			capabilities = require("plugins.lsp.config").capabilities,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)

				-- Call your on_attach function
				require("plugins.lsp.config").on_attach(client, bufnr)
			end,
		})
		require("plugins.lsp.handlers")
	end,
}
