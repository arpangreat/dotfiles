local M = {}

function M.setup()
	require("fidget").setup({
		progress = {
			display = {
				progress_icon = "…",
			},
		},
		notification = {
			poll_rate = 1,
		},
	})
end

return M
