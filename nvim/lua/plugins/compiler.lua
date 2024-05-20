return {
	{ -- This plugin
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim" },
		keys = {
			vim.keymap.set("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true }),

			vim.keymap.set(
				"n",
				"<S-F6>",
				"<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
					.. "<cmd>CompilerRedo<cr>",
				{ noremap = true, silent = true }
			),

			vim.keymap.set("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true }),
		},
		event = "VeryLazy",
		opts = {},
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		commit = "68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
			},
		},
	},
}
