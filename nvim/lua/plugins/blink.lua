return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "1.*",
	-- build = "cargo build --release --jobs 4",
	event = { "InsertEnter" },
	opts = {
		keymap = {
			preset = "enter",
		},

		cmdline = {
			keymap = {
				preset = "none",
				["<Tab>"] = {
					"show_and_insert",
					"select_next",
				},
				["<S-Tab>"] = { "show_and_insert", "select_prev" },

				["<C-n>"] = { "select_next" },
				["<C-p>"] = { "select_prev" },

				["<CR>"] = { "accept", "fallback" },
				["<C-e>"] = { "cancel" },
			},

			completion = {
				ghost_text = { enabled = false },
				menu = { auto_show = true },
			},
		},
		appearance = {
			nerd_font_variant = "normal",
		},
		completion = {
			menu = {
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "kind" },
						{ "source_name" },
					},
				},
			},
			list = {
				selection = {
					preselect = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
				},
				cycle = { from_bottom = true, from_top = true },
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
			},
			ghost_text = { enabled = true },
		},
		fuzzy = { implementation = "rust" },
		-- signature = {
		-- 	enabled = true,
		-- 	trigger = {
		-- 		show_on_insert_on_trigger_character = true,
		-- 	},
		-- 	window = {
		-- 		border = "rounded",
		-- 		winblend = 0,
		-- 		scrollbar = false,
		-- 	},
		-- },
		sources = {
			default = { "lsp", "buffer", "snippets", "path", "lazydev" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
			per_filetype = {
				lua = { inherit_defaults = true, "lazydev" },
			},
		},
	},
}
