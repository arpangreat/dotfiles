return {
	"adibhanna/laravel.nvim",
	ft = { "php", "blade" },
	keys = {
		{ "<leader>la", ":Artisan<cr>", desc = "Laravel Artisan" },
		{ "<leader>lc", ":Composer<cr>", desc = "Composer" },
		{ "<leader>lr", ":LaravelRoute<cr>", desc = "Laravel Routes" },
		{ "<leader>lm", ":LaravelMake<cr>", desc = "Laravel Make" },
	},
	config = function()
		require("laravel").setup({
			notifications = true, -- Enable/disable Laravel.nvim notifications (default: true)
			debug = false, -- Enable/disable debug error notifications (default: false)
			keymaps = true, -- Enable/disable Laravel.nvim keymaps (default: true)
			sail = {
				enabled = true, -- Enable/disable Laravel Sail integration (default: true)
				auto_detect = true, -- Auto-detect Sail usage in project (default: true)
			},
		})
	end,
}
