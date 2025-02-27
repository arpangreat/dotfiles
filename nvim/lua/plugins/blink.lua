return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	build = "cargo build --release --jobs 4",
	opts = {
		keymap = {
			preset = "enter",
		},

		cmdline = {
			keymap = {
				preset = "none",
				["<Tab>"] = {
					function(cmp)
						if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
							return cmp.accept()
						end
					end,
					"show_and_insert",
					"select_next",
				},
				["<S-Tab>"] = { "show_and_insert", "select_prev" },

				["<C-n>"] = { "select_next" },
				["<C-p>"] = { "select_prev" },

				["<CR>"] = { "accept_and_enter", "fallback" },
				["<C-e>"] = { "cancel" },
			},

			completion = {
				ghost_text = { enabled = true },
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
					treesitter = { "lsp" },
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
				-- markdown = {
				-- 	name = "RenderMarkdown",
				-- 	module = "render-markdown.integ.blink",
				-- 	fallbacks = { "lsp" },
				-- },
			},
		},
	},
}
