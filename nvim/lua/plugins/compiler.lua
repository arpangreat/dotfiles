return {
	{ -- This plugin
		"Zeioth/compiler.nvim",
		enabled = false,
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
}
