local on_attach = require("plugins.lsp.config").on_attach
local capabilities = require("plugins.lsp.config").capabilities

require("neodev").setup({})

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			type = {
				-- weakUnionCheck = true,
				-- weakNilCheck = true,
				-- castNumberToInteger = true,
			},
			format = {
				enable = true,
			},
			hint = {
				enable = true,
				arrayIndex = "Enable", -- "Enable", "Auto", "Disable"
				await = true,
				paramName = "Enable", -- "All", "Literal", "Disable"
				paramType = true,
				semicolon = "All", -- "All", "SameLine", "Disable"
				setType = true,
			},
			-- spell = {"the"}
			runtime = {
				version = "LuaJIT",
				special = {
					reload = "require",
				},
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					[vim.fn.expand("/usr/share/lua/5.4")] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})
