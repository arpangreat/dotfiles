local M = {}

function M.setup()
	require("fidget").setup({
		progress = {
			poll_rate = 0,
			suppress_on_insert = true,
			ignore_done_already = true,
			lsp = {
				log_level = vim.log.levels.WARN,
			},
		},
	})
end

return M
