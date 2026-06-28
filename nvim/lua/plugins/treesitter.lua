local M = {}

function M.setup()
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
		"tmux",
		"tsx",
		"vim",
		"lua",
		"vimdoc",
		"hyprlang",
		"diff",
		"markdown",
	}

	local nvim_ts = require("nvim-treesitter")
	nvim_ts.setup({
		install_dir = vim.fn.stdpath("data") .. "/site",
	})

	local installed = nvim_ts.get_installed("parsers")
	local missing = vim.iter(parsers)
		:filter(function(lang)
			return not vim.list_contains(installed, lang)
		end)
		:totable()

	if #missing > 0 then
		nvim_ts.install(missing)
	end

	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
		pattern = {
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
			"vim",
			"lua",
			"help",
			"hyprlang",
			"diff",
			"markdown",
		},
		callback = function(ev)
			vim.treesitter.start(ev.buf)
			vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	})
end

return M
