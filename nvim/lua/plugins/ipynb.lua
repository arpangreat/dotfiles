local M = {}

function M.setup()
	require("ipynb").setup({
		kernel = {
			auto_connect = false,
			show_status = true,
		},
		images = {
			enabled = true,
		},
	})
end

M.spec = {
	src = "ajbucci/ipynb.nvim",
	setup = false,
	on_setup = M.setup,
}

return M
