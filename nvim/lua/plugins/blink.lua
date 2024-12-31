return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	build = "cargo build --release --jobs 4",
	opts = {
		keymap = {
			preset = "enter",
			cmdline = {
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},
		},

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

			list = {
				selection = function(ctx)
					return ctx.mode == "cmdline" and "auto_insert" or "preselect"
				end,

				cycle = { from_bottom = true, from_top = true },
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
			trigger = {
				show_on_insert_on_trigger_character = true,
			},
			window = {
				border = "rounded",
				winblend = 0,
				scrollbar = false,
			},
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},
}
