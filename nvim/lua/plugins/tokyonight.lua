return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	-- enabled = false,
	config = function()
		require("tokyonight").setup({
			transparent = true,
			styles = {
				-- comments = { italic = true },
				keywords = { bold = true, italic = true },
				functions = { italic = true },
				variables = { italic = true, bold = true },
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			-- dim_inactive = true, -- dims inactive windows

			on_highlights = function(highlights, colors)
				highlights["@variable"] = { fg = colors.red }
				highlights.LspInlayHint = { bg = "#063540", fg = colors.blue2 }
				highlights.CursorLine = { bg = "#182235" }
			end,
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
