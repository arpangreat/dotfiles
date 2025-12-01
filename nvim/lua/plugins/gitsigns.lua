return {
	"echasnovski/mini.diff",
	version = false,
	event = "BufReadPost",
	config = function()
		require("mini.diff").setup({
			view = {
				style = "sign",
				signs = { add = "┃", change = "┃", delete = "_" },
			},
		})
	end,
}
