return {
	"mason-org/mason.nvim",
	event = "VeryLazy",
	-- branch = "main",
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
	end,
}
