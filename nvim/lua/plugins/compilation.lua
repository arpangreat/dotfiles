return {
	"ej-shafran/compile-mode.nvim",
	event = "VeryLazy",
	branch = "latest",
	-- or a specific version:
	-- tag = "v2.0.0"
	keys = {
		{ "<Leader>cc", "<cmd>Compile<CR>", desc = "Compiler mode" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "m00qek/baleia.nvim", tag = "v1.3.0" },
	},
	config = function()
		vim.g.compile_mode = {}
	end,
}
