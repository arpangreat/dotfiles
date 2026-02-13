---@type vim.lsp.Config
return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".emmyrc.json",
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	settings = {
		Lua = {
			completion = { callSnippet = "Both" },
			hint = {
				enable = true,
			},
			codeLens = { enable = true },
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.api.nvim_get_runtime_file("", true),
					"${3rd}/luv/library",
				},
			},
		},
	},
}
