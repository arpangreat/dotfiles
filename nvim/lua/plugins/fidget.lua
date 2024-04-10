return {
	"j-hui/fidget.nvim",
	event = "VeryLazy",
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
