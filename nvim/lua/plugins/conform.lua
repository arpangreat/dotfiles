return {
	"stevearc/conform.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
	event = "LspAttach",
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff", "format" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				-- fish = { "fish_indent" },
				go = { "gofmt", "goimports" },
				ocaml = { "ocamlformat" },
				rust = { "rustfmt" },
				zig = { "zigfmt" },
				sql = { "sqlfmt" },
				php = { "pint" },
				-- blade = { "blade-formatter" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
			},

			format_after_save = {
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
			})
		end)
	end,
}
