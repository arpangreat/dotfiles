---@type vim.lsp.Config
return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "rust-project.json" },
	settings = {
		["rust-analyzer"] = {
			cargo = {
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
}
