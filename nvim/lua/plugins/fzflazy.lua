local M = {}

local function map(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { desc = desc })
end

function M.setup()
	require("fzf-lua").setup({
		profiles = "fzf-native",
		ui_select = true,

		keymap = {
			builtin = {
				true,
				["<c-u>"] = "preview-page-down",
				["<c-d>"] = "preview-page-up",
				["<ctrl-f>"] = "preview-down",
				["<ctrl-b>"] = "preview-up",
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
		lsp = {
			code_actions = {
				previewer = "codeaction_native",
			},
		},
	})

	map("<Leader>fz", ":FzfLua ", "FzfLua")
	map("<Leader>ff", "<cmd>FzfLua files<CR>", "Find files")
	map("<Leader>fw", "<cmd>FzfLua live_grep<CR>", "Live grep")
	map("<Leader>fb", "<cmd>FzfLua buffers<CR>", "Buffers")
	map("<Leader>fh", "<cmd>FzfLua helptags<CR>", "Help tags")
	map("<Leader>fm", "<cmd>FzfLua manpages<CR>", "Man pages")
	map("<Leader>fj", "<cmd>FzfLua jump<CR>", "Jump list")
	map("<Leader>fcb", "<cmd>FzfLua lgrep_curbuf<CR>", "Grep current buffer")

	vim.keymap.set("n", "<Leader>fll", function()
		require("fzf-lua-lazy").search()
	end, { desc = "Search lazy plugins" })

	vim.keymap.set("n", "<Leader>frc", function()
		require("fzf-lua").files({ prompt = "Dotfiles> ", cwd = "~/dotfiles/nvim" })
	end, { desc = "Dotfiles" })

	vim.keymap.set("n", "<Leader>fcc", function()
		require("fzf-lua").files({ prompt = "Config> ", cwd = "~/dotfiles" })
	end, { desc = "Config files" })
end

return M
