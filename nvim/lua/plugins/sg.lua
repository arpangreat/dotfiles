return {
	"sourcegraph/sg.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",

	-- build = "nvim -l build/init.lua"
	config = function()
		local on_attach = require("plugins.lsp.config").on_attach
		require("sg").setup({
			on_attach = on_attach,
		})
	end,
}
