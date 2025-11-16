return {
	-- { "simnalamburt/vim-mundo", event = "VeryLazy" },
	-- { "mbbill/undotree", event = "VeryLazy" },
	-- {
	-- 	"nvim-mini/mini.files",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("mini.files").setup()
	-- 	end,
	-- },
	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
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
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
				{ path = "lazy.nvim", words = { "LazyVim" } },
			},
		},
	},
	{
		"nvim-mini/mini.icons",
		lazy = true,
		specs = {
			{
				"nvim-tree/nvim-web-devicons",
				enabled = true,
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
		"nvim-mini/mini.hipatterns",
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
		"b0o/SchemaStore.nvim",
		lazy = true,
	},
}
