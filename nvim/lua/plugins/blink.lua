return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "1.*",
	-- build = "cargo build --release --jobs 4",
	event = "InsertEnter",
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
				menu = { auto_show = false },
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
			default = { "lazydev", "lsp", "path", "snippets" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				--[[ cmdline = {
					enabled = function()
						local cmd_type = vim.fn.getcmdtype()
						-- disable for '/', '?', '@', '=', '-', and '>'
						if
							cmd_type == "/"
							or cmd_type == "?"
							or cmd_type == "@"
							or cmd_type == "="
							or cmd_type == "-"
							or cmd_type == ">"
						then
							return false
						end
						return true
					end,
				}, ]]
				-- markdown = {
				-- 	name = "RenderMarkdown",
				-- 	module = "render-markdown.integ.blink",
				-- 	fallbacks = { "lsp" },
				-- },
			},
		},
	},
}
