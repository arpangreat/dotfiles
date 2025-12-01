-- Lazy load LSP configurations only when needed

-- Lua
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	once = true,
	callback = function()
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
	end,
})

-- Tailwind CSS
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte" },
	once = true,
	callback = function()
		vim.lsp.enable("tailwindcss")
	end,
})

-- HTML
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "blade", "javascriptreact", "typescriptreact", "svelte" },
	once = true,
	callback = function()
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
	end,
})

-- Emmet
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "css", "jsx", "tsx" },
	once = true,
	callback = function()
		vim.lsp.enable("emmet_language_server")
	end,
})

-- Fish
vim.api.nvim_create_autocmd("FileType", {
	pattern = "fish",
	once = true,
	callback = function()
		vim.lsp.config("fish_lsp", {
			cmd = { "fish-lsp", "start", "--stdio" },
			filetypes = { "fish" },
			root_markers = {},
		})
		vim.lsp.enable("fish_lsp")
	end,
})

-- TypeScript
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	once = true,
	callback = function()
		vim.lsp.enable("ts_ls")
	end,
})

-- CSS
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "css", "scss", "less" },
	once = true,
	callback = function()
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
	end,
})

-- Java (JDTLS) - expensive, only load for Java files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	once = true,
	callback = function()
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
	end,
})

-- Zig
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zig",
	once = true,
	callback = function()
		vim.lsp.enable("zls")
	end,
})

-- Go
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	once = true,
	callback = function()
		vim.lsp.config("gopls", {
			cmd = { "gopls" },
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
	end,
})

-- Rust
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	once = true,
	callback = function()
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
	end,
})

-- Clang
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "h", "hpp" },
	once = true,
	callback = function()
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
	end,
})

-- CMake
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cmake",
	once = true,
	callback = function()
		vim.lsp.config("cmake", {
			filetypes = { "cmake" },
			settings = {},
		})
		vim.lsp.enable("cmake")
	end,
})
