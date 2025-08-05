return {
	"ej-shafran/compile-mode.nvim",
	event = "VeryLazy",
	keys = {
		{ "<Leader>cc", "<cmd>Compile<CR>", desc = "Compiler mode" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.g.compile_mode = {}
	end,
}
