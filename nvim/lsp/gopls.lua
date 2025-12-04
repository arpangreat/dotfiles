---@type vim.lsp.Config
return {
	cmd = { "gopls" },
	root_markers = { "go.mod" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
}
