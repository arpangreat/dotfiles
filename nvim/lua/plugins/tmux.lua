local M = {}

function M.setup() end

M.spec = {
	src = "christoomey/vim-tmux-navigator",
	setup = false,
	on_setup = M.setup,
}

return M
