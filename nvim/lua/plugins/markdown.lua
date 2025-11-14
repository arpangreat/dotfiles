-- For `plugins/markview.lua` users.
return {
	"OXY2DEV/markview.nvim",
	lazy = true,
	ft = "markdown",

	-- For `nvim-treesitter` users.
	priority = 49,

	-- For blink.cmp's completion
	-- source
	-- dependencies = {
	--     "saghen/blink.cmp"
	-- },
	opts = {
		experimental = {
			check_rtp = false,
			check_rtp_message = false,
		},
		preview = {
			filetypes = {
				"markdown",
				"codecompanion",
			},
		},
	},
}
