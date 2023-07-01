local on_attach = require("nv-lsp-configs.config").on_attach
local capabilities = require("nv-lsp-configs.config").capabilities

require("lspconfig").elixirls.setup({
	cmd = { "/home/arpangreat/elixir-ls/relese/language_server.sh" },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		elixirLS = {
			-- dialyzerEnabled = false,
			-- dialyzerFormat = false,
			signatureAfterComplete = true,
			enableTestLenses = true,
			additionalWatchedExtensions = true,
			fetchDeps = false,
		},
	},
})
