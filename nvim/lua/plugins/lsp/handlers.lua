local on_attach = require("plugins.lsp.config").on_attach
local capabilities = require("plugins.lsp.config").capabilities

require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").taplo.setup({ on_attach = on_attach, capabilities = capabilities })

require("lspconfig").ocamllsp.setup({
	-- cmd = { "/home/arpangreat/ocaml-lsp/_build/default/ocaml-lsp-server/bin/main.exe" },
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
	on_attach = on_attach,
	capabilities = capabilities,
})

-- require("lspconfig").gleam.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	root_dir = require("lspconfig").util.root_pattern("gleam.toml"),
-- })

require("lspconfig").r_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- require("lspconfig").htmx.setup({ on_attach = on_attach, capabilities = capabilities })

require("lspconfig").ruff_lsp.setup({
	on_attach = on_attach,
	init_options = {
		settings = {
			-- Any extra CLI arguments for `ruff` go here.
			args = {},
		},
	},
})

--[[ require("lspconfig").dartls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		dart = {
			updateImportOnRename = true,
		},
	},
}) ]]

require("lspconfig").solargraph.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").phpactor.setup({
	-- filetypes = { "php", "blade" },
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").intelephense.setup({
	-- filetypes = { "php", "blade" },
	commands = {
		IntelephenseIndex = {
			function()
				vim.lsp.buf.execute_command({ command = "intelephense.index.workspace" })
			end,
		},
	},

	on_attach = on_attach,
	capabilities = capabilities,
})

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

-- Configure it
configs.blade = {
	default_config = {
		cmd = { "/home/arpangreat/laravel-dev-tools/laravel-dev-tools", "lsp" },
		filetypes = { "blade" },
		root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
		settings = {},
	},
}
-- Set it up
lspconfig.blade.setup({
	-- Capabilities is specific to my setup.
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	-- Capabilities is specific to my setup.
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.html.setup({
	-- Capabilities is specific to my setup.
	-- filetypes = { "html", "blade" },
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.emmet_language_server.setup({
	-- Capabilities is specific to my setup.
	filetypes = { "html", "blade" },
	on_attach = on_attach,
	capabilities = capabilities,
})
