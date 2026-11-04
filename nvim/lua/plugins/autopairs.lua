local M = {}

function M.setup()
	require("nvim-autopairs").setup({
		check_ts = true,
		fast_wrap = {
			map = "<C-e>",
		},
	})
end

M.spec = {
	src = "windwp/nvim-autopairs",
	setup = false,
	on_setup = M.setup,
}

return M
