return {
	"neoclide/coc.nvim",
	event = "VeryLazy",
	-- enabled = true,
	ft = "blade",
	build = "npm ci",
	config = function()
		local keyset = vim.keymap.set
		-- Autocomplete
		function _G.check_back_space()
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
		end
		keyset(
			"i",
			"<CR>",
			[[coc#pum#visible() ? coc_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
			{ silent = true, noremap = true, expr = true }
		)

		if not vim.tbl_contains({ "blade" }, vim.bo.ft) then
			vim.cmd([[ :CocDisable ]])
		end
	end,
}
