return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	enabled = true,
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			keymap = {
				builtin = {
					true,
					["alt-n"] = "preview-page-down",
					["alt-p"] = "preview-page-up",
				},
				fzf = {
					true,
					["alt-n"] = "preview-page-down",
					["alt-p"] = "preview-page-up",
				},
			},
		})
	end,
}
