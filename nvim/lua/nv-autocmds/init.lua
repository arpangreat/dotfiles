vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.rs" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

-- PackerCompile on save if your config file is in plugins.lua or catppuccin.lua
-- DO NOT put the autocmd inside the plugin specification file or you will get 2 ^ x files open after x saves
--[[ vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "plugins.lua", "catppuccin.lua" },
	callback = function()
		vim.cmd("PackerCompile")
	end,
}) ]]
