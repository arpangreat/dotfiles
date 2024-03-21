return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "VeryLazy" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/playground",
		"danielo515/nvim-treesitter-reason",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				-- custom_captures = {
				--   -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
				--   ["foo.bar"] = "Identifier",
				-- },
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "gnc",
					scope_incremental = "gsi",
					node_decremental = "gnd",
				},
			},
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = false, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
		})
		require("ts_context_commentstring").setup({ enable_autocmd = false })
	end,
}
