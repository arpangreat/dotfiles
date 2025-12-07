return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	opts = {
		-- Progress reporting
		progress = {
			poll_rate = 0, -- Disable polling, use events only (better performance)
			suppress_on_insert = true, -- Hide during insert mode
			ignore_done_already = true, -- Don't show already-completed tasks
			lsp = {
				log_level = vim.log.levels.WARN, -- Only show warnings/errors
			},
		},
	},
}
