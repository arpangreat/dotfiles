local M = {}

function M.setup()
	require("neotab").setup({
		smart_punctuators = {
			enabled = true,
			semicolon = {
				enabled = true,
				ft = { "cs", "c", "cpp", "java" },
			},
			escape = { enabled = true },
		},
	})
end

M.spec = {
	src = "kawre/neotab.nvim",
	setup = false,
	on_setup = M.setup,
}

return M
