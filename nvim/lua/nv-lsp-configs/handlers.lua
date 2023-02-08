local on_attach = require("nv-lsp-configs.config").on_attach
local capabilities = require("nv-lsp-configs.config").capabilities

require("lspconfig").dotls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").bashls.setup({ on_attach = on_attach })
require("lspconfig").ocamlls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").vimls.setup({ on_attach = on_attach })
require("lspconfig").cssls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").dockerls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").graphql.setup({ on_attach = on_attach, capabilities = capabilities })
-- require("lspconfig").hls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").jsonls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").yamlls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })
-- require("lspconfig").phpactor.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").dartls.setup({ on_attach = on_attach, capabilities = capabilities })
-- require('sg.lsp').setup{ on_attach = on_attach, capabilities = capabilities }
-- require("lspconfig").r_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require("lspconfig").zls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").csharp_ls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").taplo.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").grammarly.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").astro.setup({ on_attach = on_attach, capabilities = capabilities })

require("lspconfig").perlnavigator.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").ols.setup({ on_attach = on_attach, capabilities = capabilities })
-- require("lspconfig").nimls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").kotlin_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").tsserver.setup({ on_attach = on_attach, capabilities = capabilities })
-- require("lspconfig").asm_lsp.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").omnisharp.setup({ on_attach = on_attach, capabilities = capabilities })
