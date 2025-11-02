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
				["<c-u>"] = "preview-page-down",
				["<c-d>"] = "preview-page-up",
				["<ctrl-f>"] = "preview-down",
				["<ctrl-b>"] = "preview-up",
				["<ctrl-p>"] = "toggle-preview",
			},
			fzf = {
				true,
				["ctrl-f"] = "half-page-up",
				["ctrl-b"] = "half-page-down",
				["ctrl-x"] = "jump",
				["ctrl-d"] = "preview-page-down",
				["ctrl-u"] = "preview-page-up",
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
