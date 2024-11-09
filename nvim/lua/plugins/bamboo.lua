return {
	"ribru17/bamboo.nvim",
	-- lazy = false,
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("bamboo").setup({
			transparent = true, -- Show/hide background
			dim_inactive = true, -- Dim inactive windows/buffers
			cmp_itemkind_reverse = true, -- reverse item kind highlights in cmp menu	-- optional configuration here

			code_style = {
				-- comments = { italic = true },
				-- conditionals = { italic = true },
				keywords = { bold = true },
				functions = { italic = true },
				-- namespaces = { italic = true },
				-- parameters = { italic = true },
				strings = { italic = true },
				variables = { italic = true, bold = true },
			},

			-- Lualine options --
			lualine = {
				transparent = true, -- lualine center bar transparency
			},

			-- Custom Highlights --
			colors = {}, -- Override default colors
			highlights = {}, -- Override highlight groups

			-- Plugins Config --
			diagnostics = {
				darker = true, -- darker colors for diagnostic
				undercurl = true, -- use undercurl instead of underline for diagnostics
				background = true, -- use background color for virtual text
			},
		})
		-- require("bamboo").load()
	end,
}
