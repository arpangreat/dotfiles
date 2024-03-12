return {
	"aznhe21/actions-preview.nvim",
	event = "LspAttach",
	config = function()
		require("actions-preview").setup()
	end,
}
