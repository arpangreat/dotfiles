return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- python = { "ruff", "format" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				fish = { "fish_indent" },
				go = { "gofmt", "goimports" },
				ocaml = { "ocamlformat" },
				rust = { "rustfmt" },
				zig = { "zigfmt" },
			},

			format_on_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<Leader>ff", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 500,
			}, { desc = "Format file or range (in visual mode)" })
		end)
	end,
}
