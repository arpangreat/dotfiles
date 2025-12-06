return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	branch = "main",
	dependencies = {
		-- "JoosepAlviste/nvim-ts-context-commentstring",
		-- "OXY2DEV/markview.nvim",
	},
	-- opts = {},
	config = function()
		local filetypes = {
			"rust",
			"zig",
			"javascript",
			"cpp",
			"c",
			"typescript",
			"go",
			"gomod",
			"gleam",
			"json",
			"jsonc",
			"java",
			"toml",
			"html",
			"css",
			"ruby",
			"ocaml",
			"php",
			"comment",
			"python",
			"dart",
			"fish",
			"tmux",
			"sql",
			"blade",
			"typescriptreact",
			"vim",
			"lua",
			"luadoc",
			"ocamllex",
			"ocaml_interface",
			"vimdoc",
			"angular",
			"vue",
			"hyprlang",
			"diff",
			"markdown",
			"markdown_inline",
			"yaml",
			"bash",
			"cmake",
		}

		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			callback = function()
				-- Defer treesitter start to avoid blocking UI
				vim.schedule(function()
					vim.treesitter.start()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end)
			end,
		})
	end,
}
