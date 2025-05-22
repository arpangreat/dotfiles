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
	on_attach = require("plugins.lsp.config").on_attach,
	capabilities = require("plugins.lsp.config").capabilities,
})

vim.lsp.enable("clangd", true)

vim.lsp.config("cmake", {
	cmd = { "/home/arpangreat/.local/share/nvim/mason/bin/cmake-language-server" },
	filetypes = { "cmake" },
	settings = {},
})

vim.lsp.enable("cmake", true)
