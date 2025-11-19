-- local on_attach = require("plugins.lsp.config").on_attach
-- local capabilities = require("plugins.lsp.config").capabilities

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
})

vim.lsp.enable("lua_ls")

vim.lsp.enable("ruff")

-- vim.lsp.enable("dartls")

vim.lsp.enable("ruby_lsp")

vim.lsp.config("phpactor", {
	filetypes = { "php", "blade" },
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
})

vim.lsp.enable("html_ls")

vim.lsp.enable("emmet_language_server")

vim.lsp.enable("fish_lsp")

-- vim.lsp.config("denols", {
-- 	settings = {
-- 		deno = {
-- 			enable = true,
-- 			suggest = {
-- 				imports = {
-- 					hosts = {
-- 						["https://deno.land"] = true,
-- 					},
-- 					autoDiscover = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

-- vim.lsp.enable("denols")

vim.lsp.enable("ts_ls")

vim.lsp.config("cssls", {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_markers = { "package.json", ".git" },
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
})

vim.lsp.enable("cssls")

vim.lsp.config("jsonls", {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			validate = { enable = true },
			schemas = require("schemastore").json.schemas(),
		},
	},
})

vim.lsp.enable("jsonls")
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
})

vim.lsp.enable("phptools")

vim.lsp.enable("jdtls")

vim.lsp.enable("zls")

vim.lsp.config("gopls", {
	cmd = { "gopls" },
	-- filetypes = { "go", "gomod" },
	-- root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			codelenses = { generate = true },
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
})

vim.lsp.enable("gopls")

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				check = {
					allTargets = false,
					command = "clippy",
				},

				loadOutDirsFromCheck = true,
			},

			checkOnSave = {
				command = "clippy",
			},

			diagnostics = {
				disabled = {
					"missing-unsafe",
					"inactive-code",
				},
			},

			completion = {
				completionItem = {
					snippetSupport = true,
				},

				fullFunctionSignatures = {
					enable = true,
				},
			},
		},
	},
})

vim.lsp.enable("rust_analyzer")

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--pch-storage=memory",
		"--clang-tidy",
		"--suggest-missing-includes",
		"--cross-file-rename",
		"--completion-style=detailed",
		"--offset-encoding=utf-16",
	},
})

vim.lsp.enable("clangd")

vim.lsp.config("cmake", {
	filetypes = { "cmake" },
	settings = {},
})

vim.lsp.enable("cmake")
