return {
	"nvim-tree/nvim-web-devicons",
	{
		"uga-rosa/ccc.nvim",
		event = "VeryLazy",
		init = function()
			require("ccc").setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end,
	},

	-- { "simnalamburt/vim-mundo", event = "VeryLazy" },
	{ "mbbill/undotree", event = "VeryLazy" },
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
		event = "VeryLazy",
		-- config = function()
		-- 	require("dressing").setup()
		-- end,
	},
	{
		"alopatindev/cargo-limit",
		ft = "rust",
		-- event = "VeryLazy",
		build = "cargo install --locked cargo-limit nvim-send",
	},
	{
		"kevinhwang91/nvim-bqf",
		event = "VeryLazy",
		ft = "qf",
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
}
