return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	enabled = false,
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local ls = require("luasnip")
		local types = require("luasnip.util.types")

		-- Every unspecified option will be set to the default.
		ls.config.set_config({
			history = true,
			-- Update more often, :h events for more info.
			updateevents = "TextChanged,TextChangedI",
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "choiceNode", "Comment" } },
					},
				},
			},
			-- treesitter-hl has 100, use something higher (default is 200).
			ext_base_prio = 300,
			-- minimal increase in priority.
			ext_prio_increase = 1,
			enable_autosnippets = true,
		})
	end,
}
