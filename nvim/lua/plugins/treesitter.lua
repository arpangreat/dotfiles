local M = {}

local parsers = {
	"rust",
	"zig",
	"javascript",
	"cpp",
	"c",
	"typescript",
	"go",
	"gomod",
	"java",
	"html",
	"css",
	"python",
	"fish",
	-- "tmux",
	"tsx",
	"vim",
	"lua",
	"vimdoc",
	"hyprlang",
	"diff",
	"markdown",
	"markdown_inline",
	-- "ghostty",
}

local filetypes = {
	"rust",
	"zig",
	"javascript",
	"cpp",
	"c",
	"typescript",
	"go",
	"gomod",
	"java",
	"html",
	"css",
	"python",
	"fish",
	-- "tmux",
	"tsx",
	"vim",
	"lua",
	"help",
	"hyprlang",
	"diff",
	"markdown",
	-- "ghostty",
}

function M.setup()
	require("nvim-treesitter").setup({
		install_dir = vim.fn.stdpath("data") .. "/site",
	})

	require("nvim-treesitter").install(parsers)

	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetypes,
		callback = function()
			vim.treesitter.start()
		end,
	})
end

return M
