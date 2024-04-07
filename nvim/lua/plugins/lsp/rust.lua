local on_attach = require("plugins.lsp.config").on_attach
local capabilities = require("plugins.lsp.config").capabilities

require("lspconfig").rust_analyzer.setup({
	server = {
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
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
	}, -- rust-analyer options
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.g.rustfmt_autosave = 1
