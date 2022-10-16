local on_attach = require("nv-lsp-configs.config").on_attach
local capabilities = require("nv-lsp-configs.config").capabilities

require("clangd_extensions").setup({
	inlay_hints = {
		show_variable_name = true,
	},
	on_attach = on_attach,
	capabilities = capabilities,
})
