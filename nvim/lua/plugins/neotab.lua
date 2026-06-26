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

return M
