local on_attach = require("plugins.lsp.config").on_attach
local capabilities = require("plugins.lsp.config").capabilities

require("lspconfig").rust_analyzer.setup({
	server = {
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					assist = {
						importGranularity = "module",
						importPrefix = "by_self",
					},
					cargo = { loadOutDirsFromCheck = true },
					procMacro = { enable = true },

					command = "clippy",
					inlayHints = true,
				},
				-- inlay_hints = {
				--   bindingModeHints = { enable = true },
				--   closureCaptureHints = { enable = true },
				--   closureReturnTypeHints = { enable = "always" },
				--   expressionAdjustmentHints = { enable = "always" },
				--   lifetimeElisionHints = { enable = "always", useParameterNames = true },
				--   reborrowHints = { enable = "always" },
				--   typeHints = { hideClosureInitialization = true, hideNamedConstructor = true },
				--   locationLinks = false,
				-- },

				procMacro = {
					enable = true,
					methodReference = true,
				},

				lens = {
					enable = true,
				},

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
						commitCharactersSupport = true,
						-- deprecatedSupport = false,
						-- documentationFormat = { "markdown", "plaintext" },
						-- preselectSupport = false,
						snippetSupport = true,
					},
				},
				-- on_attach = my_custom_attach,
			},
		},
	}, -- rust-analyer options
	on_attach = on_attach,
	capabilities = capabilities,
})
