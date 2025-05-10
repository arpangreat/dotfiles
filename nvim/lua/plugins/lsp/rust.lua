local on_attach = require("plugins.lsp.config").on_attach
local capabilities = require("plugins.lsp.config").capabilities

require("lspconfig").rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
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
			-- on_attach = my_custom_attach,
		},
	},
})
