require("vim-pack").add({
	{ src = "saghen/blink.lib", setup = false },
	{ src = "rafamadriz/friendly-snippets", setup = false },
	{
		src = "saghen/blink.cmp",
		setup = false,
		on_setup = function()
			-- PackChanged fires during vim.pack.add() on install/update.
			-- Complete the native matcher build before configuring blink.cmp.
			-- require("core.blink_build").run_if_required()
			require("blink.cmp").build():pwait()
			require("plugins.blink").setup()
		end,
	},
})
