return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	branch = "main",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", opts = { auto_install = true } },
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		require("mason-lspconfig").setup({
			automatic_installation = true,
		})
	end,
}
