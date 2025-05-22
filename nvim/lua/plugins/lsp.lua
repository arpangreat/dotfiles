return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		--[[ local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}
		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end ]]

		vim.diagnostic.config({
			-- virtual_text = {
			-- 	-- enabled = false,
			-- 	prefix = "●", -- Could be '●', '▎', 'x'
			-- 	spacing = 4,
			-- 	source = true,
			-- 	hl_mode = "blend",
			-- },
			-- virtual_text = false,
			virtual_lines = {
				current_line = true,
			},
			signs = {
				-- texthl = {
				-- 	[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
				-- 	[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
				-- 	[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				-- 	[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
				-- },
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = "",
				},
				-- linehl = {
				-- 	[vim.diagnostic.severity.ERROR] = "ErrorMsg",
				-- 	[vim.diagnostic.severity.WARN] = "WarnMsg",
				-- 	[vim.diagnostic.severity.HINT] = "HintMsg",
				-- 	[vim.diagnostic.severity.INFO] = "InfoMsg",
				-- },
				numhl = {
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					[vim.diagnostic.severity.WARN] = "WarnMsg",
					[vim.diagnostic.severity.HINT] = "HintMsg",
					[vim.diagnostic.severity.INFO] = "InfoMsg",
				},
			},
			update_in_insert = false,
			undercurl = true,
			-- severity_sort = true,
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
			on_attach = require("plugins.lsp.config").on_attach,
			capabilities = require("plugins.lsp.config").capabilities,
		})

		require("plugins.lsp.handlers")
		require("plugins.lsp.clangd")
		require("plugins.lsp.go")
		require("plugins.lsp.rust")
		require("plugins.lsp.java")
		require("plugins.lsp.zig")
		-- require("plugins.lsp.compl")
	end,
}
