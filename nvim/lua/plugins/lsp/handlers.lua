local on_attach = require("plugins.lsp.config").on_attach
local capabilities = require("plugins.lsp.config").capabilities

vim.lsp.enable("pyright")

vim.lsp.config("taplo", {
	cmd = { "taplo", "lsp", "stdio" },
	filetypes = { "toml" },
	settings = {
		-- Use the defaults that the VSCode extension uses: https://github.com/tamasfe/taplo/blob/2e01e8cca235aae3d3f6d4415c06fd52e1523934/editors/vscode/package.json
		taplo = {
			configFile = { enabled = true },
			schema = {
				enabled = true,
				catalogs = { "https://www.schemastore.org/api/json/catalog.json" },
				cache = {
					memoryExpiration = 60,
					diskExpiration = 600,
				},
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("taplo")
-- vim.lsp.enable("tombi")

vim.lsp.enable("ocamllsp")
-- require("lspconfig").v_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })

vim.lsp.config("lua_ls", {
	settings = {
		lua = {
			completion = {
				callsnippet = "Replace",
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("lua_ls")

vim.lsp.enable("r_language_server")

-- require("lspconfig").htmx.setup({ on_attach = on_attach, capabilities = capabilities })

vim.lsp.enable("ruff")

-- vim.lsp.enable("dartls")

vim.lsp.enable("ruby_lsp")

vim.lsp.config("phpactor", {
	filetypes = { "php", "blade" },
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("phpactor")

-- vim.lsp.enable("intelephense")

vim.lsp.enable("tailwindcss")

vim.lsp.config("html_ls", {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = {
		"html",
		"blade",
		"javascriptreact",
		"typescriptreact",
		"svelte",
	},
	root_markers = { "index.html", ".git" },
	init_options = { provideFormatter = true },
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("html_ls")

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
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("denols")

vim.lsp.config("cssls", {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_markers = { "package.json", ".git" },
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("cssls")

vim.lsp.enable("sourcekit")

vim.lsp.enable("marksman")

vim.lsp.config("jsonls", {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			validate = { enable = true },
			schemas = require("schemastore").json.schemas(),
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("jsonls")
-- lspconfig.stimulus_ls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	root_dir = require("lspconfig.util").root_pattern("composer.json"),
-- })
vim.lsp.config("phptools", {
	filetypes = { "php", "blade" },
	settings = {
		php = {
			stubs = "all",
			condelens = {
				enabled = true,
			},
			completion = {
				autoimport = "auto-import",
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("phptools")
