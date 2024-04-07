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
