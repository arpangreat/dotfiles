vim.lsp.set_log_level("debug")

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- Could be '●', '▎', 'x'
	},
	signs = { active = signs },
	update_in_insert = true,
	undercurl = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

require("nv-lsp-configs.java")
require("nv-lsp-configs.handlers")
require("nv-lsp-configs.go")
require("nv-lsp-configs.lua")
require("nv-lsp-configs.rust")
require("nv-lsp-configs.clangd")
-- require("nv-lsp-configs.elixir")
require("nv-lsp-configs.scala")
