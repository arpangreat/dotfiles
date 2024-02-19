local on_attach = require("plugins.lsp.config").on_attach
local capabilities = require("plugins.lsp.config").capabilities

require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").taplo.setup({ on_attach = on_attach, capabilities = capabilities })

require("lspconfig").ocamllsp.setup({
	settings = {
		codelens = { enable = true },
		extendedHover = { enable = true },
	},
	on_attach = on_attach,
	capabilities = capabilities,
})
require("lspconfig").v_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})
