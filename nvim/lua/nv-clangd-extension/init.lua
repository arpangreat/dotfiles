local navic = require("nv-navic")

require("clangd_extensions").setup({
	inlay_hints = {
		show_variable_name = true,
	},
	on_attach = function(client, bufnr)
		navic.attach(client, bufnr)
	end,
})
