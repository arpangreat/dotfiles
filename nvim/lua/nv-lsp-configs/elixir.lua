local on_attach = require("nv-lsp-configs.config").on_attach
local capabilities = require("nv-lsp-configs.config").capabilities

require("lspconfig").elixills.setup({
	cmd = { "/home/arpangreat/.local/share/nvim/mason/bin/elixir-ls" },
	on_attach = on_attach,
	capabilities = capabilities,
})
