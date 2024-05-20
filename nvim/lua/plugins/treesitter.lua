return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "VeryLazy" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/playground",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				-- custom_captures = {
				--   -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
				--   ["foo.bar"] = "Identifier",
				-- },
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})
		require("ts_context_commentstring").setup({ enable_autocmd = false })
		-- Install grammar with nvim-treesitter
		local list = require("nvim-treesitter.parsers").get_parser_configs()
		list.reason = {
			install_info = {
				url = "https://github.com/reasonml-editor/tree-sitter-reason",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "master",
			},
		}
	end,
}
