local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "$HOME/dotfiles/nvim/",
	})
end

M.search_notes = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Notes >",
		cwd = "$HOME/wiki/",
		layout_strategy = "vertical",
	})
end

M.search_configs = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Configs >",
		cwd = "$HOME/dotfiles/",
	})
end

return M
