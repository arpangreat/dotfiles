return {
	"aznhe21/actions-preview.nvim",
	-- enabled = false,
	event = "LspAttach",
	config = function()
		require("actions-preview").setup()
	end,
}
