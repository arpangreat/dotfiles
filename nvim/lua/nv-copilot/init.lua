require("copilot").setup({
	panel = {
		keymap = {
			jump_next = "<c-j>",
			jump_prev = "<c-k>",
			accept = "<c-f>",
			refresh = "r",
			open = "<M-CR>",
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = "<c-f>",
			next = "<c-j>",
			prev = "<c-k>",
			dismiss = "<c-h>",
		},
	},
	filetypes = {
		yaml = false,
		markdown = true,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
})
