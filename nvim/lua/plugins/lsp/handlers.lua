vim.lsp.enable("pyright")
-- vim.lsp.enable("taplo")
vim.lsp.enable("tombi")

vim.lsp.enable("ocamllsp")
-- require("lspconfig").v_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })

vim.lsp.config("lua_ls", {
	settings = {
		lua = {
			completion = {
				callsnippet = "replace",
			},
		},
	},
})
vim.lsp.enable("lua_ls")

vim.lsp.enable("r_language_server")

-- require("lspconfig").htmx.setup({ on_attach = on_attach, capabilities = capabilities })

vim.lsp.enable("ruff")

vim.lsp.enable("dartls")

vim.lsp.enable("ruby_lsp")

vim.lsp.enable("phpactor")

vim.lsp.enable("intelephense")

vim.lsp.enable("html")

vim.lsp.enable("emmet_language_server")

vim.lsp.enable("fish_lsp")

vim.lsp.config("denols", {
	settings = {
		deno = {
			enable = true,
			suggest = {
				imports = {
					hosts = {
						["https://deno.land"] = true,
					},
					autoDiscover = true,
				},
			},
		},
	},
	on_attach = require("plugins.lsp.config").on_attach,
	capabilities = require("plugins.lsp.config").capabilities,
})
vim.lsp.enable("denols")

vim.lsp.enable("cssls")

vim.lsp.enable("sourcekit")
-- lspconfig.stimulus_ls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	root_dir = require("lspconfig.util").root_pattern("composer.json"),
-- })
