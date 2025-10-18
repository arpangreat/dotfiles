return {
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter" },
	-- enabled = false,
	opts = {
		-- space2 = { enable = true }, --Config goes here
		tsnode = { enable = true },
		treesitter = { enable = true },
		fly = { enable = true },
		surround = { enable = true },
		tabout = { enable = true }, --Config goes here
		close = { enable = true }, --Config goes here
		fastwrap = {
			map = "<C-e>",
			rmap = "<C-e>",
			cmap = "<C-e>",
			rcmap = "<C-e>",
		},
	},
}
