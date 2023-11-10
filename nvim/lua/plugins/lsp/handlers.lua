local on_attach = require("plugins.lsp.config").on_attach
local capabilities = require("plugins.lsp.config").capabilities

require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").dartls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require("lspconfig").taplo.setup({ on_attach = on_attach, capabilities = capabilities })

require("lspconfig").kotlin_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").tsserver.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").ocamllsp.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").v_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })

require("lspconfig").omnisharp.setup({
	enable_editorconfig_support = true,
	enable_ms_build_load_projects_on_demand = true,
	enable_roslyn_analyzers = true,
	organize_imports_on_format = true,
	enable_import_completion = true,
	sdk_include_prereleases = true,
	analyze_open_documents_only = true,
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").elixirls.setup({
	cmd = { "/home/arpangreat/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		elixirLS = {
			dialyzerEnabled = true,
			dialyzerFormat = true,
			signatureAfterComplete = true,
			enableTestLenses = true,
			additionalWatchedExtensions = true,
		},
	},
})
