return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}
		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = {
				prefix = "●", -- Could be '●', '▎', 'x'
			},
			signs = { active = signs },
			update_in_insert = true,
			undercurl = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		require("plugins.lsp.handlers")
		require("plugins.lsp.clangd")
		require("plugins.lsp.go")
		require("plugins.lsp.lua")
		require("plugins.lsp.rust")
		require("plugins.lsp.java")
		require("plugins.lsp.scala")
		require("plugins.lsp.zig")
	end,
}
