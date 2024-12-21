return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	build = "cargo build --release --jobs 4",
	opts = {
		keymap = { preset = "enter" },

		appearance = {
			use_nvim_cmp_as_default = true,
		},

		completion = {
			menu = {
				border = "rounded",
				winblend = 0,
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
				window = {
					winblend = 0,
					border = "rounded",
				},
			},
			ghost_text = { enabled = true },
		},
		signature = {
			enabled = true,
			window = {
				border = "rounded",
				winblend = 0,
				scrollbar = false,
			},
		},
		sources = {
			-- add lazydev to your completion providers
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
	},
}
