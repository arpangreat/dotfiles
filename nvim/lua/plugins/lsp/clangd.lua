local on_attach = require("plugins.lsp.config").on_attach
local capabilities = require("plugins.lsp.config").capabilities
local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
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
	on_attach = on_attach,
	capabilities = capabilities,
})

local configs = require("lspconfig.configs")

if not configs.cmake_ls then
	configs.cmake_ls = {
		default_config = {
			cmd = { "/home/arpangreat/.local/share/nvim/mason/bin/cmake-language-server" },
			filetypes = { "cmake" },
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname)
			end,
			settings = {},
		},
	}
end

require("lspconfig").cmake_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
