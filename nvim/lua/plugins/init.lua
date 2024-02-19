return {
	"nvim-tree/nvim-web-devicons",
	{
		"uga-rosa/ccc.nvim",
		init = function()
			require("ccc").setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end,
	},
	{ "simnalamburt/vim-mundo", event = "VeryLazy" },
	{
		"echasnovski/mini.files",
		event = "VeryLazy",
		config = function()
			require("mini.files").setup()
		end,
	},
	{
		"echasnovski/mini.cursorword",
		event = "VeryLazy",
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{ "WhoIsSethDaniel/lualine-lsp-progress.nvim", event = "VeryLazy" },
	{
		"stevearc/dressing.nvim",
		lazy = true,
		config = function() end,
	},
}
