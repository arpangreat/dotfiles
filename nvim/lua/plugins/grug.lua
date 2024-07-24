return {
	"MagicDuck/grug-far.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<Leader>gf",
			"<cmd>GrugFar<cr>",
			desc = "Grug Far",
		},
	},
	config = function()
		require("grug-far").setup({})
	end,
}
