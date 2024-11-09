return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	-- enabled = false,
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons", "roginfarrer/fzf-lua-lazy.nvim" },
	opts = function()
		-- calling `setup` is optional for customization
		local config = require("fzf-lua.config")

		-- keymap = {
		-- 	builtin = {
		-- 		true,
		-- 		["alt-n"] = "preview-page-down",
		-- 		["alt-p"] = "preview-page-up",
		-- 	},
		-- 	fzf = {
		-- 		true,
		-- 		["alt-n"] = "preview-page-down",
		-- 		["alt-p"] = "preview-page-up",
		-- 	},
		-- },
		config.defaults.keymap.fzf["alt-n"] = "preview-page-down"
		config.defaults.keymap.fzf["alt-n"] = "preview-page-down"
		config.defaults.keymap.builtin["<alt-p>"] = "preview-page-up"
		config.defaults.keymap.builtin["<alt-p>"] = "preview-page-up"
	end,
}
