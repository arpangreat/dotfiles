return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufWinEnter" },
	-- lazy = false,
	branch = "main",
	dependencies = {
		-- "JoosepAlviste/nvim-ts-context-commentstring",
	},
	-- opts = {},
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"rust",
				"zig",
				"javascript",
				"cpp",
				"typescript",
				"go",
				"json",
				"toml",
				"html",
				"css",
				"ruby",
				"ocaml",
				"php",
				"comment",
				"java",
				"python",
				"prolog",
				"tcl",
				"r",
				"dart",
				"fish",
				"tmux",
				"config",
				"cfg",
				"perl",
				"sql",
				"blade",
			},
			callback = function()
				vim.treesitter.start()
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
		-- vim.treesitter.start()
	end,
	-- config = function()
	-- 	require("nvim-treesitter.configs").setup({
	-- 		highlight = {
	-- 			enable = true,
	-- 			-- custom_captures = {
	-- 			--   -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
	-- 			--   ["foo.bar"] = "Identifier",
	-- 			-- },
	-- 		},
	-- 		incremental_selection = {
	-- 			enable = true,
	-- 			keymaps = {
	-- 				init_selection = "gnn", -- set to `false` to disable one of the mappings
	-- 				node_incremental = "grn",
	-- 				scope_incremental = "grc",
	-- 				node_decremental = "grm",
	-- 			},
	-- 		},
	-- 	})

	-- 	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

	-- 	---@class parser_config
	-- 	parser_config.blade = {
	-- 		install_info = {
	-- 			url = "https://github.com/EmranMR/tree-sitter-blade",
	-- 			files = { "src/parser.c" },
	-- 			branch = "main",
	-- 		},

	-- 		filetype = "blade",
	-- 	}

	-- 	vim.filetype.add({
	-- 		pattern = {
	-- 			[".*%.blade%.php"] = "blade",
	-- 		},
	-- 	})
	-- 	-- require("ts_context_commentstring").setup({ enable_autocmd = false })
	-- end,
}
