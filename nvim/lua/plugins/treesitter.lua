local M = {}

function M.setup()
	require("tree-sitter-manager").setup({
		ensure_installed = {
			"rust",
			"zig",
			"javascript",
			"cpp",
			"c",
			"typescript",
			"typescriptreact",
			"go",
			"gomod",
			"java",
			"html",
			"css",
			"python",
			"fish",
			"tmux",
			"tsx",
			"vim",
			"lua",
			"vimdoc",
			"hyprlang",
			"diff",
			"markdown",
			"markdown_inline",
			"ghostty",
		},
		auto_install = true,
	})
end

return M
