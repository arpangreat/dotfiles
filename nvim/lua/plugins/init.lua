return {
	-- { "simnalamburt/vim-mundo", event = "VeryLazy" },
	-- { "mbbill/undotree", event = "VeryLazy" },
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		lazy = true,
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"nvim-mini/mini.icons",
		lazy = true,
		opts = {
			file = {
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		},
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		"nvim-mini/mini.hipatterns",
		event = "VeryLazy",
		config = function()
			local hi = require("mini.hipatterns")

			require("mini.hipatterns").setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
				},
			})
		end,
	},
}
