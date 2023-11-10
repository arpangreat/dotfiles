local on_attach = require("plugins.lsp.config").on_attach
local capabilities = require("plugins.lsp.config").capabilities

local lspconfig = require("lspconfig")

lspconfig.zls.setup({
	cmd = { "/usr/bin/zls" },
	on_attach = on_attach,
	capabilities = capabilities,
})
