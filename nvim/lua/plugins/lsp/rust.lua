vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},

			diagnostics = {
				disabled = {
					"missing-unsafe",
					"inactive-code",
				},
			},

			signatureHelp = {
				dynamicRegistration = true,
				signatureInformation = {
					activeParameterSupport = true,
					documentationFormat = { "markdown", "plaintext" },
					parameterInformation = {
						labelOffsetSupport = true,
					},
				},
			},

			completion = {
				completionItem = {
					-- commitCharactersSupport = true,
					-- deprecatedSupport = false,
					-- documentationFormat = { "markdown", "plaintext" },
					-- preselectSupport = false,
					snippetSupport = true,
				},

				fullFunctionSignatures = {
					enable = true,
				},
			},

			typing = {
				autoClosingAngleBrackets = {
					enable = true,
				},
			},

			experimental = {
				serverStatusNotification = true,
			},
			-- on_attach = my_custom_attach,
		},
	},
	on_attach = require("plugins.lsp.config").on_attach,
	capabilities = require("plugins.lsp.config").capabilities,
})

vim.lsp.enable("rust_analyzer")
