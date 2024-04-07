return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	config = function()
		local on_attach = require("plugins.lsp.config").on_attach
		local capabilities = require("plugins.lsp.config").capabilities

		require("flutter-tools").setup({
			widget_guides = {
				enabled = true,
			},
			lsp = {
				on_attach = on_attach,
				capabilities = capabilities,
			},
		})
	end,
}
