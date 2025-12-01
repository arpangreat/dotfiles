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

vim.lsp.config("fish_lsp", {
	cmd = { "fish-lsp", "start", "--stdio" }, -- try this first
	filetypes = { "fish" },
	root_markers = {},
})
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

-- Ensure workspace directory exists
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

vim.lsp.config("jdtls", {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Xms512m",
		"-Xmx2g",
		"-Xlog:disable",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		launcher_jar,
		"-configuration",
		jdtls_path .. "/config_linux",
		"-data",
		vim.fn.expand("~/.cache/jdtls-workspace/java-learning"),
	},
	filetypes = { "java" },
	root_markers = { "settings.gradle.kts", "settings.gradle", ".git" },
	settings = {
		java = {
			autobuild = { enabled = true },
			import = {
				gradle = { enabled = true },
			},
		},
	},
	init_options = { bundles = {} },
})

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
				features = "all",
				allTargets = false,
			},

			check = {
				command = "clippy",
			},
			checkOnSave = {
				enable = true,
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
