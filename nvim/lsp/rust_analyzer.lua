---@type vim.lsp.Config
return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "rust-project.json" },
	capabilities = {
		experimental = {
			serverStatusNotification = true,
			commands = {
				commands = {
					"rust-analyzer.showReferences",
					"rust-analyzer.runSingle",
					"rust-analyzer.debugSingle",
				},
			},
		},
	},
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
			lens = {
				debug = { enable = true },
				enable = true,
				implementations = { enable = true },
				references = {
					adt = { enable = true },
					enumVariant = { enable = true },
					method = { enable = true },
					trait = { enable = true },
				},
				run = { enable = true },
				updateTest = { enable = true },
			},
		},
	},
}
