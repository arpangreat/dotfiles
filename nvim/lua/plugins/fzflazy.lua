return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	-- enabled = false,
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons", "roginfarrer/fzf-lua-lazy.nvim" },
	opts = {
		-- calling `setup` is optional for customization
		-- local config = require("fzf-lua.config")
		profiles = "fzf-native",

		keymap = {
			builtin = {
				true,
				["<ctrl-f>"] = "preview-page-down",
				["<ctrl-b>"] = "preview-page-up",
				["<ctrl-u>"] = "preview-down",
				["<ctrl-d>"] = "preview-up",
				["<ctrl-p>"] = "toggle-preview",
			},
			fzf = {
				true,
				["ctrl-u"] = "half-page-up",
				["ctrl-d"] = "half-page-down",
				["ctrl-x"] = "jump",
				["ctrl-f"] = "preview-page-down",
				["ctrl-b"] = "preview-page-up",
			},
		},
		-- config.defaults.keymap.fzf["alt-n"] = "preview-page-down"
		-- config.defaults.keymap.fzf["alt-n"] = "preview-page-down"
		-- config.defaults.keymap.builtin["<alt-p>"] = "preview-page-up"
		-- config.defaults.keymap.builtin["<alt-p>"] = "preview-page-up"
	},
	config = function(_, opts)
		local fzf = require("fzf-lua")
		fzf.setup(opts)
		fzf.register_ui_select()
	end,
}
