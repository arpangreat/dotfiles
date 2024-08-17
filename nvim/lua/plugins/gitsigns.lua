return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("gitsigns").setup({
			numhl = true,
			-- linehl = true,
			-- word_diff = true,
			attach_to_untracked = true,
			current_line_blame = true,
		})
	end,
}
