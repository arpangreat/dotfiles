local on_attach = require("nv-lsp-configs.config").on_attach
local capabilities = require("nv-lsp-configs.config").capabilities

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			type = {
				-- weakUnionCheck = true,
				-- weakNilCheck = true,
				-- castNumberToInteger = true,
			},
			format = {
				enable = false,
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
					-- [vim.fn.datapath "config" .. "/lua"] = true,
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
