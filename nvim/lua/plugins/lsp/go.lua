local on_attach = require("plugins.lsp.config").on_attach
local capabilities = require("plugins.lsp.config").capabilities

local lspconfig = require("lspconfig")

lspconfig.gopls.setup({
	cmd = { "gopls" },
	-- filetypes = { "go", "gomod" },
	-- root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			codelenses = { generate = true },
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})
