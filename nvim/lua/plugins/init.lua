return {
	{
		"uga-rosa/ccc.nvim",
		event = "VeryLazy",
		enabled = false,
		init = function()
			require("ccc").setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end,
	},

	-- { "simnalamburt/vim-mundo", event = "VeryLazy" },
	{ "mbbill/undotree", event = "VeryLazy" },
	{
		"echasnovski/mini.files",
		event = "VeryLazy",
		config = function()
			require("mini.files").setup()
		end,
	},
	{
		"echasnovski/mini.cursorword",
		event = "VeryLazy",
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{ "WhoIsSethDaniel/lualine-lsp-progress.nvim", event = "VeryLazy" },
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		-- config = function()
		-- 	require("dressing").setup()
		-- end,
	},
	{
		"kevinhwang91/nvim-bqf",
		event = "VeryLazy",
		ft = "qf",
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{
		"echasnovski/mini.icons",
		lazy = true,
		specs = {
			{
				"nvim-tree/nvim-web-devicons",
				enabled = false,
				optional = true,
			},
		},
		opts = {
			file = {
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		"echasnovski/mini.hipatterns",
		event = "VeryLazy",
		config = function()
			local hi = require("mini.hipatterns")

			require("mini.hipatterns").setup({
				highlighters = {
					hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
					shorthand = {
						pattern = "()#%x%x%x()%f[^%x%w]",
						group = function(_, _, data)
							---@type string
							local match = data.full_match
							local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
							local hex_color = "#" .. r .. r .. g .. g .. b .. b

							return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
						end,
						extmark_opts = { priority = 2000 },
					},
				},
			})
		end,
	},
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {},
	},
	{
		"canop/nvim-bacon",
		ft = "rust",
	},
}
