require("vim-pack").add({
	{
		src = "romus204/tree-sitter-manager.nvim",
		setup = false,
		on_setup = require("plugins.treesitter").setup,
	},
})
