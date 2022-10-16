local on_attach = require("nv-lsp-configs.config").on_attach
local capabilities = require("nv-lsp-configs.config").capabilities

require("lspconfig").gopls.setup({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	-- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})
