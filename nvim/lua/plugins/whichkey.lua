return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		show_help = true, -- show help message on the command line when the popup is visible
		triggers = {
			{ "<auto>", mode = "nixsotc" },
			{ "a", mode = { "n", "v" } },
		}, -- automatically setup triggers
		show_keys = true, -- show the currently pressed key and its label as a message in the command line

		icons = {
			keys = {
				Leader = "󱁐 ",
				LocalLeader = ",",
			},
		},

		spec = {
			{ "<leader>l", group = "Lazy" },
			{ "<leader>ll", "<cmd>Lazy<CR>", desc = "Lazy Home" },
			{ "<leader>lf", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "find file" },
			{ "<leader>f", group = "FzfLua", icon = " " },
			{ "<leader>s", group = "Split" },
			{ "<leader>g", group = "Lsp" },
			{ "<leader>m", group = "Mini" },
			{ "<leader>q", group = "Quit" },
			{ "<leader>ex", group = "Quit" },
			{ "<leader>w", group = "Write" },
			{ "<leader>h", group = "Mini.Diff" },
			{ "]h", "<cmd>lua require('mini.diff').goto_hunk('next')<cr>", desc = "Next Hunk" },
			{ "[h", "<cmd>lua require('mini.diff').goto_hunk('prev')<cr>", desc = "Prev Hunk" },
			{ "<leader>hd", "<cmd>lua require('mini.diff').toggle_overlay()<cr>", desc = "Toggle Overlay" },
			{ "<leader>x", group = "Trouble" },
		},
	},
}
