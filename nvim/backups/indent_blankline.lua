return {
	{
		"echasnovski/mini.indentscope",
		enabled = false,
		event = "BufReadPost",
		opts = {},
		config = function()
			require("mini.indentscope").setup({})
		end,
	},
}
