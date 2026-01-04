return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{ "<Leader>fz", ":FzfLua ", desc = "FzfLua" },
		{ "<Leader>ff", "<cmd>FzfLua files<CR>", desc = "Find files" },
		{
			"<Leader>fll",
			function()
				require("fzf-lua-lazy").search()
			end,
			desc = "Search lazy plugins",
		},
		{ "<Leader>fw", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
		{ "<Leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
		{ "<Leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Help tags" },
		{ "<Leader>fm", "<cmd>FzfLua manpages<CR>", desc = "Man pages" },
		{ "<Leader>fj", "<cmd>FzfLua jump<CR>", desc = "Jump list" },
		{
			"<Leader>frc",
			function()
				require("fzf-lua").files({ prompt = "Dotfiles> ", cwd = "~/dotfiles/nvim" })
			end,
			desc = "Dotfiles",
		},
		{
			"<Leader>fcc",
			function()
				require("fzf-lua").files({ prompt = "Config> ", cwd = "~/dotfiles" })
			end,
			desc = "Config files",
		},
		{ "<Leader>fcb", "<cmd>FzfLua lgrep_curbuf<CR>", desc = "Grep current buffer" },
	},
	dependencies = { "roginfarrer/fzf-lua-lazy.nvim" },
	opts = {
		profiles = "fzf-native",
		ui_select = true,

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
		-- lsp = {
		-- 	code_actions = {
		-- 		previewer = "codeaction_native",
		-- 	},
		-- },
		-- config.defaults.keymap.fzf["alt-n"] = "preview-page-down"
		-- config.defaults.keymap.fzf["alt-n"] = "preview-page-down"
		-- config.defaults.keymap.builtin["<alt-p>"] = "preview-page-up"
		-- config.defaults.keymap.builtin["<alt-p>"] = "preview-page-up"
	},
}
