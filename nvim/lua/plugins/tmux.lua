return {
	"christoomey/vim-tmux-navigator",
	event = "VeryLazy",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<A-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<A-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<A-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<A-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<A-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}
