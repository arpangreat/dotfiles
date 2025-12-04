---@type vim.lsp.Config
return {
	cmd = {
		"clangd",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--fallback-style=none",
		"--suggest-missing-includes",
		"--cross-file-rename",
		"--all-scopes-completion", -- Show completions from all scopes
		"--completion-parse=auto", -- Parse more for better completions
		"--enable-config", -- Enable .clangd config files
		"--compile-commands-dir=build", -- Where to find compile_commands.json
		"--query-driver=/usr/bin/g++", -- Auto-detect system headers
		"--j=3",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac", -- AutoTools
		".git",
	},
}
