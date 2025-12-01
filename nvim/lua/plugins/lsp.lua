return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	config = function()
		vim.diagnostic.config({
			virtual_lines = {
				current_line = true,
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = " ",
					[vim.diagnostic.severity.INFO] = " ",
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
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = " ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			update_in_insert = false,
			undercurl = true,
			float = {
				scope = "line",
				border = "single",
			},
			on_jump = {
				float = true,
			},
		})

		vim.lsp.config("*", {
			capabilities = require("plugins.lsp.config").get_capabilities(),
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				require("plugins.lsp.config").on_attach(client, bufnr)
			end,
		})

		-- Defer handlers loading to avoid slow startup
		vim.schedule(function()
			require("plugins.lsp.handlers")
		end)
	end,
}
