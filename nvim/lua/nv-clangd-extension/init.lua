local navic = require("nv-navic")
local function on_attach(client, bufnr)
		navic.attach(client, bufnr)
		require("aerial").on_attach(client, bufnr)
end

require("clangd_extensions").setup({
	inlay_hints = {
		show_variable_name = true,
	},
	on_attach = on_attach,
})
