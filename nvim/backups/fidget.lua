return {
	"j-hui/fidget.nvim",
	event = "VeryLazy",
	enabled = false,
	opts = {
		progress = {
			lsp = {
				progress_ringbuf_size = 2048,
			},
		},
		notification = {
			window = {
				winblend = 0,
			},
		},
	},
}
