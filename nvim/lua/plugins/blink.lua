local M = {}

require("core.blink_build").setup()

function M.setup()
	require("blink.cmp").setup({
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
				menu = {
					auto_show = function(ctx)
						return vim.fn.getcmdtype() == ":"
						-- enable for inputs as well, with:
						-- or vim.fn.getcmdtype() == '@'
					end,
				},
			},
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
			default = { "lsp", "snippets", "path", "buffer" },
		},
	})
end

M.specs = {
	{ src = "saghen/blink.lib", setup = false },
	{ src = "rafamadriz/friendly-snippets", setup = false },
	{
		src = "saghen/blink.cmp",
		setup = false,
		on_setup = function()
			-- PackChanged fires during vim.pack.add() on install/update.
			-- Complete the native matcher build before configuring blink.cmp.
			-- require("core.blink_build").run_if_required()
			require("blink.cmp").build():pwait()
			M.setup()
		end,
	},
}

return M
